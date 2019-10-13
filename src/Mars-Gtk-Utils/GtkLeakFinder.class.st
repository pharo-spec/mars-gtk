Class {
	#name : #GtkLeakFinder,
	#superclass : #SignalLogger,
	#instVars : [
		'created',
		'destroyed',
		'mutex',
		'zombies'
	],
	#category : #'Mars-Gtk-Utils'
}

{ #category : #accessing }
GtkLeakFinder >> collected [

	^ created \ (self leaks)
]

{ #category : #accessing }
GtkLeakFinder >> collectedWithInstancesCount [

	^ (self collected collect: [ :each | each -> (each instanceCount) ]) asDictionary
]

{ #category : #registering }
GtkLeakFinder >> ensureLoggingSignals [
	
	self signals do: #resume
]

{ #category : #initialize }
GtkLeakFinder >> initialize [

	super initialize.
	mutex := Mutex new.
	self reset
]

{ #category : #'as yet unclassified' }
GtkLeakFinder >> inspectorLeaks [
	<inspectorPresentationOrder: 0 title: 'Leaks'>
	| table |

	^ (table := SpTablePresenter new)
		addColumn: (SpStringTableColumn title: 'Widget' evaluated: [ :assoc | assoc key asString ]);
		addColumn: (SpStringTableColumn title: 'References' evaluated: [ :assoc | assoc value ]);
		items: self leaksWithReferenceCount;
		contextMenu: (SpMenuPresenter new 
			addItem: [ :item | item 
				name: 'Explore pointers'; 
				action: [ StInspector inspect: table selectedItem findAllPaths ] ];
			yourself);
		yourself
]

{ #category : #accessing }
GtkLeakFinder >> leaks [

	3 timesRepeat: [ Smalltalk garbageCollect ].
	^ created select: [ :each | (destroyed includes: each handle) not ]
]

{ #category : #accessing }
GtkLeakFinder >> leaksWithInstancesCount [

	^ (self leaks collect: [ :each | each -> (each instanceCount) ]) asDictionary
]

{ #category : #accessing }
GtkLeakFinder >> leaksWithReferenceCount [

	^ (self leaks collect: [ :each | each -> (each referenceCount) ]) asDictionary
]

{ #category : #registering }
GtkLeakFinder >> logCreateSignal: aSignal [

	mutex critical: [ 
		created add: (GtkWidgetTrace new 
			widgetClass: aSignal widget class;
			handle: aSignal widget getHandle copy;
			yourself) ]
]

{ #category : #registering }
GtkLeakFinder >> logDestroySignal: aSignal [

	mutex critical: [ 
		destroyed add: aSignal handle copy ]
]

{ #category : #registering }
GtkLeakFinder >> logZombieSignal: aSignal [

	mutex critical: [ 
		zombies add: (GtkWidgetTrace new 
			widgetClass: aSignal target;
			handle: aSignal handle copy;
			yourself) ]
]

{ #category : #registering }
GtkLeakFinder >> nextPut: aSignal [

	aSignal logIn: self
]

{ #category : #initialize }
GtkLeakFinder >> reset [
	
	created := Set new.
	destroyed := Set new.
	zombies := Set new
]

{ #category : #registering }
GtkLeakFinder >> signals [

	^ { GtkCreateSignal. GtkDestroySignal. GtkZombieSignal }
]

{ #category : #registering }
GtkLeakFinder >> start [

	self ensureLoggingSignals.
	super start
]

{ #category : #accessing }
GtkLeakFinder >> zombies [

	3 timesRepeat: [ Smalltalk garbageCollect ].
	^ zombies
]
