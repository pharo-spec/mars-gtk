Class {
	#name : #GtkRoassalExample,
	#superclass : #Object,
	#instVars : [
		'window',
		'actionBar',
		'baseMorph',
		'editorView',
		'listView',
		'athensView'
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

	^ ((RTAbstractExample allSubclasses collect: #new) 
		sortedAs: #label)
		asArray
]

{ #category : #building }
GtkRoassalExample >> buildAthensView [
		
	^ GtkScrolledWindow new
]

{ #category : #building }
GtkRoassalExample >> buildListView [
	| store list renderer |
	
	store := GtkListStore newColumnTypes: { GType G_TYPE_STRING }.

	self allExamples do: [ :each |
		store appendRow
			atColumnIndex: 0 
			setValue: each label utf8Encoded ].
	
	list := GtkTreeView new.
	list model: store.

	renderer := GtkCellRendererText new.
	list appendColumn: (GtkTreeViewColumn new
		renderer: renderer;
		setAttribute: 'text' toColumAtIndex: 0 forRenderer: renderer).
		
	list connectRowSelected: [ :path | path toString crLog ].

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

{ #category : #showing }
GtkRoassalExample >> show [ 

	GtkApplication ensureRunning.
	window := self buildWindow.
	window 
		center;
		showAll
]
