Class {
	#name : #GtkRoassalExample,
	#superclass : #Object,
	#instVars : [
		'window',
		'listView',
		'examples',
		'treeStore',
		'roassalView'
	],
	#category : #'Mars-Gtk-Examples'
}

{ #category : #showing }
GtkRoassalExample class >> show [
	<script>

	^ self new show
]

{ #category : #accessing }
GtkRoassalExample >> allExamples [

	^ examples ifNil: [ examples := self collectExamples ] 
]

{ #category : #building }
GtkRoassalExample >> buildRoassalView [
		
	^ GtkRoassalExampleView new
]

{ #category : #building }
GtkRoassalExample >> buildTreeView [
	| tree renderer |

	(tree := GtkTreeView new)
		headersVisible: false;
		model: (treeStore := self newTreeStore);
		connectSelectionChanged: [ 
			5 milliSeconds wait.
			self selectExample: tree allSelected first ].
		
	renderer := GtkCellRendererText new.
	tree appendColumn: (GtkTreeViewColumn new
		renderer: renderer;
		setAttribute: 'text' toColumAtIndex: 0 forRenderer: renderer).
		
	tree addExpanderColumn.
	tree enableTreeLines.

	^ tree
]

{ #category : #building }
GtkRoassalExample >> buildWindow [
 
	^ GtkWindow new 
		autoRelease;
		title: 'Athens example';
		resize: 800 @ 400;
		add:(GtkPaned newHorizontal
			pack1: (GtkScrolledWindow newWidget: (listView := self buildTreeView));
			pack2: (GtkScrolledWindow newWidget: (roassalView := self buildRoassalView));
			yourself);
		yourself
]

{ #category : #private }
GtkRoassalExample >> collectExamples [
	| dict |
	
	dict := OrderedDictionary new.
	((RTAbstractExample allSubclasses collect: #new) sortedAs: #label) do: [ :eachGroup |
		dict 
			at: eachGroup 
			put: (eachGroup class methods select: [ :each | each selector beginsWith: 'example' ]) ].
	^ dict select: #notEmpty
]

{ #category : #building }
GtkRoassalExample >> newTreeStore [
	| store |
	
	store := GtkTreeStore newColumnTypes: { GType G_TYPE_STRING }.
	self allExamples keysAndValuesDo: [ :group :groupExamples | | row |
		groupExamples ifNotEmpty: [ 
			(row := store appendRow)
				atColumnIndex: 0 
				setValue: group label utf8Encoded.
			groupExamples do: [ :each |
				row newChild 
					atColumnIndex: 0 
					setValue: each selector utf8Encoded ] ] ].

	^ store

]

{ #category : #actions }
GtkRoassalExample >> selectExample: aPath [
	| group method view |
	
	"Root, skip"
	aPath size = 1 ifTrue: [ ^ self ].
	
	group := self allExamples keyAtIndex: aPath first.
	method := (self allExamples at: group) at: aPath second.
	
	view := method valueWithReceiver: group arguments: #().
	(view isKindOf: RTView) ifFalse: [ ^ self ]. 
	
	roassalView view: view.
	view inspect
]

{ #category : #showing }
GtkRoassalExample >> show [ 

	GtkApplication ensureRunning.
	window := self buildWindow.
	window 
		data: self; "using 'data' to keep a reference alive. Do I need the concept of 'model'"
		center;
		showAll
]
