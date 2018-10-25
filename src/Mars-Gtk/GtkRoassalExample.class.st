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
		
	^ GtkScrolledWindow new
]

{ #category : #building }
GtkRoassalExample >> buildListView [
	|  list renderer |

	list := GtkTreeView new.
	list model: (listStore := self newListStore).

	renderer := GtkCellRendererText new.
	list appendColumn: (GtkTreeViewColumn new
		renderer: renderer;
		setAttribute: 'text' toColumAtIndex: 0 forRenderer: renderer).
		
	list connectRowSelected: [ :path | (self allExamples at: path first) crLog ].

	^ list
]

{ #category : #building }
GtkRoassalExample >> buildWindow [
 
	^ GtkWindow new 
		autoRelease;
		title: 'Athens example';
		resize: 400 @ 400;
		add:(GtkPaned newVertical
			pack1: (listView := self buildListView);
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

{ #category : #showing }
GtkRoassalExample >> show [ 

	GtkApplication ensureRunning.
	window := self buildWindow.
	window 
		data: self; "using 'data' to keep a reference alive. Do I need the concept of 'model'"
		center;
		showAll
]
