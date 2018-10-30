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
			50 milliSeconds wait.
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
			put: eachGroup class gtExamples ].
	^ dict select: #notEmpty
]

{ #category : #private }
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
	| group example |
	
	"Root, skip"
	aPath size = 1 ifTrue: [ ^ self ].
	
	"Not root, process view"
	group := self allExamples keyAtIndex: aPath first.
	example := (self allExamples at: group) at: aPath second.
	example run returnValue ifNotNil: [ :return | 
		roassalView view: return view ]
	
]

{ #category : #showing }
GtkRoassalExample >> show [ 

	GtkApplication ensureRunning.
	window := self buildWindow.
	roassalView inspect.
	window 
		data: self; "using 'data' to keep a reference alive. Do I need the concept of 'model'"
		center;
		showAll
]
