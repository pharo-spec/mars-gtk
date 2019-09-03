Class {
	#name : #GtkTestProvider,
	#superclass : #GObject,
	#classInstVars : [
		'gClass'
	],
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #accessing }
GtkTestProvider class >> gClass [ 

	^ gClass
]

{ #category : #accessing }
GtkTestProvider class >> gType [ 

	^ self gClass gType
]

{ #category : #'class initialization' }
GtkTestProvider class >> initialize [

	"this should work like this, "
	"self installGClass"
]

{ #category : #accessing }
GtkTestProvider class >> initialize: gClassHandle [
	
]

{ #category : #accessing }
GtkTestProvider class >> initializeInterfaces: aGClass [

	aGClass addInterface: GtkSourceCompletionProviderIface initialize: [ :ifaz | 
		ifaz 
			map: #get_name to: [ :instance | self name ];
			map: #priority to: [ :instance | instance priority ];
			map: #populate to: [ :instance | instance populate ] ].
]

{ #category : #accessing }
GtkTestProvider class >> installGClass [

	gClass := GClass install: self
]

{ #category : #accessing }
GtkTestProvider >> name [

	^ 'TestProvider'
]

{ #category : #accessing }
GtkTestProvider >> populate: aContext [
	"| gList |

	gList := GList new.
	gList appendString: 'abc'. 
	self 
		addProposals:  
		to: aContext
		finished: true"
]

{ #category : #accessing }
GtkTestProvider >> priority [

	^ 0
]
