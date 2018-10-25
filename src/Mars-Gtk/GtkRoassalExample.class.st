Class {
	#name : #GtkRoassalExample,
	#superclass : #Object,
	#instVars : [
		'window',
		'listView',
		'athensView',
		'listStore',
		'examples'
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
GtkRoassalExample >> buildAthensView [
		
	^ GtkScrolledWindow newWidget: (GtkLabel newLabel: 'Select an example!')
]

{ #category : #building }
GtkRoassalExample >> buildListView [
	|  list renderer |

	(list := GtkTreeView new)
		headersVisible: false;
		model: (listStore := self newListStore);
		connectSelectionChanged: [ self selectExample: list allSelected first ].
		
	renderer := GtkCellRendererText new.
	list appendColumn: (GtkTreeViewColumn new
		renderer: renderer;
		setAttribute: 'text' toColumAtIndex: 0 forRenderer: renderer).

	^ list
]

{ #category : #building }
GtkRoassalExample >> buildWindow [
 
	^ GtkWindow new 
		autoRelease;
		title: 'Athens example';
		resize: 800 @ 400;
		add:(GtkPaned newHorizontal
			pack1: (GtkScrolledWindow newWidget: (listView := self buildListView));
			pack2: (athensView := self buildAthensView);
			yourself);
		yourself
]

{ #category : #private }
GtkRoassalExample >> collectExamples [
	
	^ ((RTAbstractExample allSubclasses collect: #new) 
		sortedAs: #label)
		asArray
]

{ #category : #building }
GtkRoassalExample >> newListStore [
	| store |
	
	store := GtkListStore newColumnTypes: { GType G_TYPE_STRING }.
	self allExamples do: [ :each |
		store appendRow
			atColumnIndex: 0 
			setValue: each label utf8Encoded ].
	^ store

]

{ #category : #actions }
GtkRoassalExample >> selectExample: aPath [

	self inform: aPath asString 
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
