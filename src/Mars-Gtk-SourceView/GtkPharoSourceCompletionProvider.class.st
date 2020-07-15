"
This is a completion provider for Pharo Source.
It implements a GtkSourceCompletionProviderIface (see gDefine: and gDefineCompletionProviderInterface: interface)
It uses CompletionContext to provide useful completions in editors.

"
Class {
	#name : #GtkPharoSourceCompletionProvider,
	#superclass : #GObject,
	#instVars : [
		'completionEngine',
		'iconsCache',
		'theWord'
	],
	#classVars : [
		'Separators'
	],
	#pools : [
		'GtkSourceCompletionActivation'
	],
	#category : #'Mars-Gtk-SourceView'
}

{ #category : #'class initialization' }
GtkPharoSourceCompletionProvider class >> gClass [

	^ GClass gClassAt: self
]

{ #category : #'class initialization' }
GtkPharoSourceCompletionProvider class >> gDefine: gClass [

	gClass
		addInterface: GtkSourceCompletionProviderIface 
		initialize: [ :interface | self gDefineCompletionProviderInterface: interface ]
]

{ #category : #'class initialization' }
GtkPharoSourceCompletionProvider class >> gDefineCompletionProviderInterface: interface [

	interface
		get_name: (GCallback
			signature: #(gchar *(void *provider)) 
			block: [ :provider | (self gInstance: provider) name ]);
		get_icon: (GCallback
			signature: #(void *(void *provider)) 
			block: [ :provider | ExternalAddress null ]);
		get_priority: (GCallback 
			signature: #(gint (void *provider)) 
			block: [ :provider | 1 ]);
		get_activation: (GCallback 
			signature: #(uint32 (void *provider)) 
			block: [ :provider | (self gInstance: provider) activation ]);
		get_interactive_delay: (GCallback 
			signature: #(gint (void *provider)) 
			block: [ :provider | -1 ]);
		"match: (GCallback 
			signature: #(gboolean (void *provider, void *context))
			block: [ :provider :context | 
				(self gInstance: provider) match: (GtkSourceCompletionContext fromHandle: context) ]);"
		get_start_iter: (GCallback 
			signature: #(gboolean (void *provider, void *context, void *proposal, void *iter))
			block: [ :provider :context :proposal :iter | 
				(self gInstance: provider) 
					startIterContext: (GtkSourceCompletionContext fromHandle: context)
					proposal: (GtkSourceCompletionItem fromHandle: proposal)
					iter: (GtkTextIter fromHandle: iter) ]);
		populate: (GCallback
			signature: #(void (void *provider, void *context))
			block: [ :provider :context | 
				(self gInstance: provider) populate: (GtkSourceCompletionContext fromHandle: context) ]);
		activate_proposal: (GCallback 
			signature: #(gboolean (void *provider, void *proposal, void *iter))
			block: [ :provider :proposal :iter |
				(self gInstance: provider) 
					activateProposal: (GtkSourceCompletionItem fromHandle: proposal)
					iter: (GtkTextIter fromHandle: iter) ])
]

{ #category : #'class initialization' }
GtkPharoSourceCompletionProvider class >> gInstance: handle [

	^ self gClass findInstance: handle
]

{ #category : #'instance creation' }
GtkPharoSourceCompletionProvider class >> new [

	^ (GClass gDefinitionAt: self) new
]

{ #category : #private }
GtkPharoSourceCompletionProvider class >> separators [

	^ Separators ifNil: [ Separators := Character separators, Character specialCharacters ]
]

{ #category : #accessing }
GtkPharoSourceCompletionProvider >> activateProposal: proposal iter: iter [
	| word textToInsert |

	word := self currentWord: iter in: iter buffer.
	word ifNil: [ ^ false ].
	
	self flag: #TODO. "Decide if we add a space at the end is a decision that can be configurable"
	textToInsert := (proposal label allButFirst: word size) copyWith: Character space.
	iter buffer insertTextAtCursor: textToInsert.
 
	^ true
]

{ #category : #accessing }
GtkPharoSourceCompletionProvider >> activation [

	^ GTK_SOURCE_COMPLETION_ACTIVATION_INTERACTIVE value
]

{ #category : #private }
GtkPharoSourceCompletionProvider >> cleanWord: aString [
	"remove cascade and end of sentence"

	^ aString reject: [ :each | #(; .) includes: each  ]
]

{ #category : #accessing }
GtkPharoSourceCompletionProvider >> completionEngine [
	^ completionEngine
]

{ #category : #accessing }
GtkPharoSourceCompletionProvider >> completionEngine: anObject [
	completionEngine := anObject
]

{ #category : #private }
GtkPharoSourceCompletionProvider >> completionEntriesFor: iter [
	| completionContext word textBuffer |

	textBuffer := iter buffer.
	word := self currentWord: iter in: textBuffer.
	word ifNil: [ ^ #() ].

	completionContext := CoCompletionContext
		engine: self completionEngine
		class: self completionEngine completionClass
		source: textBuffer text
		position: iter offset.
	completionContext narrowWith: word.

	^ completionContext entries
]

{ #category : #private }
GtkPharoSourceCompletionProvider >> currentWord: iter in: textBuffer [
	| start line |
		
	start := iter copyInMemory lineOffset: 0.
	line := textBuffer 
		textStart: start 
		end: iter
		includeHiddenChars: false.
	line ifNil: [ ^ nil ].
	
	(line isEmpty 
		or: [ self class separators includes: line last ]) 
		ifTrue: [ ^ nil ].
	
	^ self cleanWord: line substrings last
]

{ #category : #private }
GtkPharoSourceCompletionProvider >> iconAt: icon ifAbsentPut: aBlock [ 

	iconsCache ifNil: [ iconsCache := IdentityDictionary new ].
	^ iconsCache 
		at: icon 
		ifAbsentPut: aBlock
]

{ #category : #accessing }
GtkPharoSourceCompletionProvider >> match: context [

	self flag: 'This is actually not used. Is here for documentation only'.
	^ true
]

{ #category : #accessing }
GtkPharoSourceCompletionProvider >> name [

	^ 'Pharo'
]

{ #category : #accessing }
GtkPharoSourceCompletionProvider >> populate: context [
	| proposals iter entries |
	
thisContext method selector printToStdout.

	iter := context iter.
iter getHandle printToStdout.
iter dummy1 printToStdout.
	
	theWord := self currentWord: iter in: iter buffer.
	theWord printToStdout.
	
	entries := iter 
		ifNotNil: [ self completionEntriesFor: iter ]
		ifNil: [ #() ].

	proposals := GList new.
	entries ifNotEmpty: [ 
		entries do: [ :each |
			proposals := proposals append: (self toItem: each) ].
		"Ensure the list will be pointing to first element (and ensure it will be released)"
		proposals := proposals first ].
	
	context 
		addProposals: proposals
		provider: self 
		finished: true.
	
	proposals free
]

{ #category : #accessing }
GtkPharoSourceCompletionProvider >> priority [

	^ 1
]

{ #category : #accessing }
GtkPharoSourceCompletionProvider >> startIterContext: context proposal: proposal iter: iter [
	| word |

	(iter isNil or: [ iter isNull ]) ifTrue: [ ^ false ].
	"I cannot use 'context iter' to get this value because apparently the function does 
	 a kid of merge, more than fill it completely, and the source completion needs both: what 
	 will be assigned and what is already there :("
	(context getIter: iter) ifFalse: [ ^ false ].

	word := self currentWord: iter in: iter buffer.
	word ifNil: [ ^ false ].

	^ true
]

{ #category : #private }
GtkPharoSourceCompletionProvider >> toItem: aCompletionEntry [
	| item |

	item := GtkSourceCompletionItem newLabel: aCompletionEntry contents.
	aCompletionEntry icon ifNotNil: [ :icon |
		item icon: (self 
			iconAt: icon
			ifAbsentPut: [ GdkPixbuf newForm: icon ]) ].
	^ item
]
