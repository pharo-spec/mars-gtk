Class {
	#name : #GClassForTestWithInterface,
	#superclass : #GtkWidget,
	#classInstVars : [
		'gClass',
		'initializedInterface'
	],
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #accessing }
GClassForTestWithInterface class >> gClass [ 

	^ gClass
]

{ #category : #accessing }
GClassForTestWithInterface class >> gType [ 

	^ self gClass type
]

{ #category : #initialization }
GClassForTestWithInterface class >> initialize: aHandle [

]

{ #category : #accessing }
GClassForTestWithInterface class >> initializeInterfaces: aGClass [

	aGClass addInterface: GInterfaceForTest initialize: [ :ifaz |
		initializedInterface := true.
		
		"ifaz 
			map: #get_name to: [ :instance | self name ];
			map: #priority to: [ :instance | instance priority ];
			map: #populate to: [ :instance | instance populate ]" ]
]

{ #category : #testing }
GClassForTestWithInterface class >> isInterfaceInitialized [

	^ initializedInterface
]

{ #category : #accessing }
GClassForTestWithInterface class >> reset [

	super reset.
	initializedInterface := false
]
