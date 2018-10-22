Class {
	#name : #GtkExample,
	#superclass : #Object,
	#instVars : [
		'method',
		'widget',
		'title',
		'category'
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
GtkExample >> method: aCollection [ 
	method := aCollection
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
GtkExample >> widget [
	^ widget ifNil: [ widget := method valueWithReceiver: method methodClass instanceSide arguments: #() ]
]
