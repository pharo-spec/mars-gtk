Class {
	#name : #STxStyleVisitor,
	#superclass : #Object,
	#instVars : [
		'parentheseLevel',
		'bracketLevel',
		'contextClass',
		'tags'
	],
	#category : #'Mars-Spec-Text'
}

{ #category : #private }
STxStyleVisitor >> addStyle: style from: start to: end [ 
	
	tags add: (STxStyleTag newName: style from: start to: end)
]

{ #category : #accessing }
STxStyleVisitor >> contextClass: aClass [

	contextClass := aClass
]

{ #category : #private }
STxStyleVisitor >> currentClosedBracketStyleName [
	
	bracketLevel isZero ifTrue: [ ^ #blockEnd ].
	^ (#blockEnd asString, bracketLevel asString) asSymbol
]

{ #category : #private }
STxStyleVisitor >> currentClosedParenthesisStyleName [

	parentheseLevel isZero ifTrue: [ ^ #rightParenthesis ].
	^ (#rightParenthesis asString, parentheseLevel asString) asSymbol
]

{ #category : #private }
STxStyleVisitor >> currentOpenedBracketStyleName [

	bracketLevel isZero ifTrue: [ ^ #blockStart ].
	^ (#blockStart asString, bracketLevel asString) asSymbol
]

{ #category : #private }
STxStyleVisitor >> currentOpenedParenthesisStyleName [

	parentheseLevel isZero ifTrue: [ ^ #leftParenthesis ].
	^ (#leftParenthesis asString, parentheseLevel asString) asSymbol
]

{ #category : #private }
STxStyleVisitor >> literalStyleSymbol: aValue [

	aValue isSymbol 		ifTrue: [ ^ #symbol ].
	aValue isString 		ifTrue: [ ^ #string ].
	aValue isCharacter 	ifTrue: [ ^ #character ].
	aValue isNumber 		ifTrue: [ ^ #number ].
	aValue == true 			ifTrue: [ ^ #true ].
	aValue == false 		ifTrue: [ ^ #false ].
	aValue isNil 			ifTrue: [ ^ #nil ].

	^ #default
]

{ #category : #private }
STxStyleVisitor >> methodOrBlockArgStyleFor: aRBArgumentNode [ 
	
	^ aRBArgumentNode isBlockVar
		ifTrue: [ #blockArg ]
		ifFalse: [ #methodArg ]
]

{ #category : #private }
STxStyleVisitor >> methodOrBlockTempDeclStyleFor: aSequenceNode [
	
	^ aSequenceNode scope isBlockScope
		ifTrue: [ #blockPatternTempVar ]
		ifFalse: [ #patternTempVar ]
]

{ #category : #private }
STxStyleVisitor >> methodOrBlockTempStyleFor: aRBTemporaryNode [ 
	
	^ aRBTemporaryNode isBlockVar
		ifTrue: [ #blockTempVar ]
		ifFalse: [ #tempVar ]
]

{ #category : #private }
STxStyleVisitor >> reset [
	
	tags := OrderedCollection new.
	parentheseLevel := 0.
	bracketLevel := 0
]

{ #category : #private }
STxStyleVisitor >> resolveStyleFor: aRBVariableNode [ 

	aRBVariableNode binding ifNil: [^#default].
	aRBVariableNode isArg ifTrue: [ ^#methodArg].
	aRBVariableNode isTemp ifTrue: [ ^#tempVar].
	aRBVariableNode isGlobal ifTrue: [ ^#globalVar].
	aRBVariableNode isInstance ifTrue: [ ^#instVar]. 
	aRBVariableNode hasIncompleteIdentifier ifTrue:[ ^#incompleteIdentifier].
	
	^#invalid.
]

{ #category : #private }
STxStyleVisitor >> styleCloseBracket: aRBBlockNode [ 
	
	bracketLevel := bracketLevel - 1.
	(aRBBlockNode right isZero or: [ aRBBlockNode value isNil ]) ifTrue:[ ^ self ].
	self 
		addStyle: self currentClosedBracketStyleName 
		from: aRBBlockNode right 
		to: aRBBlockNode right
]

{ #category : #private }
STxStyleVisitor >> styleCloseParenthese: aMessageNode [
	
	aMessageNode parentheses ifNotEmpty: [ 
		aMessageNode parentheses reverseDo: [ :interval | 
			| pos |
			pos := interval last.
			parentheseLevel := parentheseLevel - 1.
			self addStyle: self currentClosedParenthesisStyleName from: pos to: pos ] ]
]

{ #category : #private }
STxStyleVisitor >> styleOpenBracket: aRBBlockNode [
	| style |

	style := aRBBlockNode isFaulty
		ifTrue: [ #invalid ]
		ifFalse: [ self currentOpenedBracketStyleName ].
	self addStyle: style from: aRBBlockNode left to: aRBBlockNode left.
	bracketLevel := bracketLevel + 1
]

{ #category : #private }
STxStyleVisitor >> styleOpenParenthese: aMessageNode [
	
	aMessageNode parentheses ifNotEmpty: [ 
		aMessageNode parentheses
			do: [ :interval | 
				| pos |
				pos := interval first.
				self addStyle:  self currentOpenedParenthesisStyleName from: pos to: pos.
				parentheseLevel := parentheseLevel + 1 ] ]
]

{ #category : #private }
STxStyleVisitor >> styleTempBars: aRBSequenceNode [ 
	| tempBarAttribute |

	tempBarAttribute := aRBSequenceNode scope isMethodScope
		ifTrue: [ #methodTempBar ]
		ifFalse: [ #blockTempBar ].
	aRBSequenceNode leftBar ifNotNil: [ :pos | 
		self addStyle: tempBarAttribute from: pos to: pos ].
	aRBSequenceNode rightBar ifNotNil: [ :pos | 
		self addStyle: tempBarAttribute from: pos to: pos ]
]

{ #category : #accessing }
STxStyleVisitor >> tags [

	^ tags
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitAST: ast [
	| context |

	self reset.
	context := (Smalltalk compiler compilationContextClass new
		class: contextClass;
		forSyntaxHighlighting: true;
		requestor: nil;
		yourself).
	ast methodNode compilationContext: context.
	ast doSemanticAnalysis.

	ast acceptVisitor: self
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitArgumentNode: aRBArgumentNode [ 
	| blockOrMethodArgStyle |
	
	blockOrMethodArgStyle := self methodOrBlockArgStyleFor: aRBArgumentNode.
	self 
		addStyle: blockOrMethodArgStyle 
		from: aRBArgumentNode start
		to: aRBArgumentNode stop
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitAssignmentNode: aRBAssignmentNode [

	self visitNode: aRBAssignmentNode variable.
	self visitNode: aRBAssignmentNode value.
	aRBAssignmentNode variable binding isWritable
		ifFalse: [ self addStyle: #invalid forNode: aRBAssignmentNode ]
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitBlockNode: aRBBlockNode [ 

	aRBBlockNode comments do: [ :comment | self addStyle: #comment from: comment start to: comment stop ].
	aRBBlockNode arguments do: [ :argument | self addStyle: #blockPatternArg from: argument start to: argument stop ].
	aRBBlockNode bar ifNotNil: [ :pos | self addStyle: #blockArgsBar from: pos to: pos ].
	aRBBlockNode colons do: [ :pos | self addStyle: #blockArgColon from: pos to: pos ].
	
	self styleOpenBracket: aRBBlockNode.
	self visitNode: aRBBlockNode body.
	self styleCloseBracket: aRBBlockNode
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitCascadeNode: aRBCascadeNode [

	aRBCascadeNode messages do: [ :each | self visitNode: each ].
	aRBCascadeNode semicolons do: [ :pos | self addStyle: #cascadeSeparator from: pos to: pos ]
]

{ #category : #visiting }
STxStyleVisitor >> visitExpression: aString [

	self visitAST: (RBParser parseFaultyExpression: aString).
	^ self tags
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitGlobalNode: aRBGlobalNode [

	self 
		addStyle: #globalVar
		from: aRBGlobalNode start 
		to: aRBGlobalNode stop
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitLiteralArrayNode: aRBLiteralArrayNode [
	"in a (valid) byte array all elements are of the same type, style the whole 
	 contents at once, but for ordinary literal arrays, style every node"

	(aRBLiteralArrayNode isForByteArray 
		and: [ aRBLiteralArrayNode isFaulty not 
		and: [ aRBLiteralArrayNode contents isNotEmpty ] ]) 
		ifTrue: [ 
			self addStyle: #number 
				from: aRBLiteralArrayNode start + 2 
				to: aRBLiteralArrayNode stop - 1 ]
		ifFalse: [ 
			aRBLiteralArrayNode contents do: [ :each | self visitNode: each ] ]
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitLiteralNode: aRBLiteralValueNode [ 
	| value |
	
	value := aRBLiteralValueNode value.
	self 
		addStyle: (self literalStyleSymbol: value)
		from: aRBLiteralValueNode start
		to: aRBLiteralValueNode stop
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitMessageNode: aRBMessageNode [ 
	| style link |
	
	style := #keyword.
	(Symbol findInternedSelector: aRBMessageNode selector asString) 
		ifNil: [ 
			style := (Symbol selectorThatStartsCaseSensitive: aRBMessageNode selector asString skipping: nil) isNil
				ifTrue: [ #undefinedKeyword ]
				ifFalse: [ #incompleteKeyword ] ].

	self styleOpenParenthese: aRBMessageNode.
	aRBMessageNode selectorParts
		with: aRBMessageNode keywordsPositions
		do: [ :keyword :position | 
			self
				addStyle: style
				from: position
				to: position + keyword size - 1 ].
	(aRBMessageNode isCascaded not or: [ aRBMessageNode isFirstCascaded ])
		ifTrue: [ self visitNode: aRBMessageNode receiver ].
	aRBMessageNode arguments do: [ :each | self visitNode: each ].
	self styleCloseParenthese: aRBMessageNode
]

{ #category : #visiting }
STxStyleVisitor >> visitMethod: aString [
	| ast |

	ast := RBParser parseFaultyMethod: aString.
	ast isParseError ifTrue: [ ^ self visitExpression: aString ].
	self visitAST: ast.
	^ self tags
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitMethodComments: comments [

	comments do: [ :comment | self addStyle: #comment from: comment start to: comment stop ].
	"PharoDocCommentNode docCommentEnabled
		ifTrue: [ comments do: [ :comment | self styleDocComment: comment ] ]"
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitMethodNode: aRBMethodNode [ 
	
	self visitMethodComments: aRBMethodNode comments.
	
	"aMethodNode arguments do: [ :argument | self addStyle: #patternArg forNode: argument ].
	link := TextMethodLink selector: aMethodNode selector."
	aRBMethodNode selectorParts
		with: aRBMethodNode keywordsPositions
		do: [ :keyword :position | 
			self
				addStyle: #patternKeyword
				from: position
				to: position + keyword size - 1 ].
	aRBMethodNode pragmas do: [ :each | self visitNode: each ].	
	
	self visitNode: aRBMethodNode body
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitNode: aRBNode [ 
	
	aRBNode comments do: [ :comment |
		self 
			addStyle: #comment
			from: comment start
			to: comment stop ].

	^ aRBNode acceptVisitor: self
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitParseErrorNode: aRBParseErrorNode [ 
	
	self 
		addStyle: #invalid
		from: aRBParseErrorNode  start 
		to: aRBParseErrorNode  stop
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitPragmaNode: aRBPragmaNode [ 

	aRBPragmaNode selectorParts 
		with: aRBPragmaNode keywordsPositions 
		do: [ :keyword : position |
			self 
				addStyle: #pragmaKeyword
				from: position
				to: position + keyword size ].
	
	aRBPragmaNode arguments do: [ :each | self visitNode: each ]	
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitReturnNode: aRBReturnNode [ 
	
	self 
		addStyle: #return
		from: aRBReturnNode start
		to: aRBReturnNode stop.
		
	self visitNode: aRBReturnNode value
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitSelfNode: aRBSelfNode [
	
	self 
		addStyle: #self
		from: aRBSelfNode start
		to: aRBSelfNode stop
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitSequenceNode: aRBSequenceNode [ 
	| patternTempStyle |
	
	patternTempStyle := self methodOrBlockTempDeclStyleFor: aRBSequenceNode.
	self styleTempBars: aRBSequenceNode.
	aRBSequenceNode temporaries do: [ :temporary | 
		self 
			addStyle: patternTempStyle 
			from: temporary start
			to: temporary stop ].
	aRBSequenceNode statements do: [ :each | self visitNode: each ].
	aRBSequenceNode periods do: [ :pos | 
		self 
			addStyle: #statementSeparator 
			from: pos 
			to: pos ]
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitSuperNode: aRBSuperNode [ 

	self 
		addStyle: #super 
		from: aRBSuperNode start
		to: aRBSuperNode stop
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitTemporaryNode: aRBTemporaryNode [ 
	| methodOrBlockTempStyle |
		
	methodOrBlockTempStyle := self methodOrBlockTempStyleFor: aRBTemporaryNode.
	self 
		addStyle: methodOrBlockTempStyle 
		from: aRBTemporaryNode start
		to: aRBTemporaryNode stop
]

{ #category : #'private visiting' }
STxStyleVisitor >> visitVariableNode: aRBVariableNode [ 
	
	self 
		addStyle: (self resolveStyleFor: aRBVariableNode) 
		from: aRBVariableNode start
		to: aRBVariableNode stop.
	
	
]