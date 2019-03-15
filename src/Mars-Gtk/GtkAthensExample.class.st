Class {
	#name : #GtkAthensExample,
	#superclass : #Object,
	#instVars : [
		'window',
		'athensView',
		'actionBar',
		'baseMorph'
	],
	#category : #'Mars-Gtk-Examples'
}

{ #category : #showing }
GtkAthensExample class >> show [
	<script>

	^ self new show
]

{ #category : #building }
GtkAthensExample >> buildActionBar [

	^ GtkActionBar new
		packStart: ((GtkButton newLabel: 'Previous')
			connectClicked: [ self previous ];
			yourself);
		packEnd: ((GtkButton newLabel: 'Next')
			connectClicked: [ self next ];
			yourself);
		yourself
]

{ #category : #building }
GtkAthensExample >> buildAthensView [

	^ GtkAthensExampleView new
]

{ #category : #building }
GtkAthensExample >> buildWindow [
 
	^ GtkWindow new 
		autoRelease;
		title: 'Athens example';
		resize: 400 @ 400;
		add:(GtkBox newVertical 
			packStart: (athensView := self buildAthensView);
			packEnd: (actionBar := self buildActionBar) expand: false fill: false padding: 0;
			yourself);
		yourself
]

{ #category : #actions }
GtkAthensExample >> next [

	athensView next
]

{ #category : #actions }
GtkAthensExample >> previous [

	athensView previous
]

{ #category : #showing }
GtkAthensExample >> show [ 

	GtkApplication ensureRunning.
	window := self buildWindow.
	window 
		center;
		showAll
]
