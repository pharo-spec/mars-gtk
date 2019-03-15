Class {
	#name : #GtkExample,
	#superclass : #Object,
	#instVars : [
		'method',
		'widget',
		'title',
		'category',
		'layoutBlock'
	],
	#category : #'Mars-Gtk-Examples'
}

{ #category : #'instance creation' }
GtkExample class >> allFrom: aClass [

	^ ((aClass classSide methods select: [ :m | 
		m hasPragmaNamed: #gtkExample ])
			collect: [ :each | self on: each ])
				sorted
]

{ #category : #'instance creation' }
GtkExample class >> on: aMethod [

	^ self new
		method: aMethod;
		yourself
]

{ #category : #accessing }
GtkExample >> <= anotherExample [

	^ self category < anotherExample category
		or: [ self category = anotherExample category
				and: [ self title <= anotherExample title ] ]
]

{ #category : #accessing }
GtkExample >> category [
	
	^ category ifNil: [ | pragma |
		((pragma := method pragmaAt: #category:)
			ifNil: [ 'Uncategorized' ]
			ifNotNil: [ pragma arguments first ]) asString ]
]

{ #category : #accessing }
GtkExample >> category: aString [ 
	category := aString asString
]

{ #category : #accessing }
GtkExample >> gtkExample [
	"I implement gtk examples"
	^ self
]

{ #category : #opening }
GtkExample >> initialize [

	super initialize.
	self layoutGridSimple
]

{ #category : #layout }
GtkExample >> layoutFillContainer [
	
	layoutBlock := [ :widgetToLayout |
		GtkBox newVertical
			packStart: widgetToLayout expand: true fill: true padding: 0;
			yourself ]
]

{ #category : #layout }
GtkExample >> layoutGridSimple [
	
	layoutBlock := [ :widgetToLayout |
		GtkGrid new
			attach: widgetToLayout at: 0@0;
			yourself ]
]

{ #category : #layout }
GtkExample >> layoutHorizontalBoxNoFill [
	
	layoutBlock := [ :widgetToLayout |
		GtkBox newHorizontal
			packStart: widgetToLayout expand: false fill: false padding: 0;
			yourself ]
]

{ #category : #layout }
GtkExample >> layoutVerticalBoxNoFill [
	
	layoutBlock := [ :widgetToLayout |
		GtkBox newVertical
			packStart: widgetToLayout expand: false fill: false padding: 0;
			yourself ]
]

{ #category : #accessing }
GtkExample >> method: aCollection [ 
	method := aCollection.
	method pragmas do: [ :each | each message sendTo: self ]
]

{ #category : #opening }
GtkExample >> openInGtkWindow [

	GtkApplication ensureRunning.
	GtkWindow new 
		autoRelease;
		title: self title;
		resize: 500@200;
		add: self widget;
		center;
		showAll;
		inspect
]

{ #category : #accessing }
GtkExample >> sourceCode [
	
	^ method sourceCode
]

{ #category : #accessing }
GtkExample >> title [
	^ title ifNil: [ | pragma |
		((pragma := method pragmaAt: #title:)
			ifNil: [ method selector ]
			ifNotNil: [ pragma arguments first ]) asString ]
]

{ #category : #accessing }
GtkExample >> title: aString [ 
	title := aString asString
]

{ #category : #accessing }
GtkExample >> widget [
	^ widget ifNil: [ widget := layoutBlock value: (method valueWithReceiver: method methodClass instanceSide arguments: #()) ]
]
