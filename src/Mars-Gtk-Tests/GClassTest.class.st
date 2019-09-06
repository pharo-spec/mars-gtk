Class {
	#name : #GClassTest,
	#superclass : #TestCase,
	#category : #'Mars-Gtk-Tests'
}

{ #category : #private }
GClassTest >> randomNameForTest [

	^ 'Test',
	((self toByteArray: DateAndTime now asDuration asMilliSeconds size: 4),
	 (self toByteArray: 9999 atRandom size: 2))
	 asInteger
	 asString
]

{ #category : #running }
GClassTest >> setUp [
	
	super setUp.
	GClassForTest reset
]

{ #category : #tests }
GClassTest >> testInstall [
	| gClass name |

	name := self randomNameForTest.
	gClass := GClass install: GClassForTest with: [ :definition |
		definition
			name: name;
			parent: GtkWidget;
			addInterface: GInterfaceForTest initialize: [ :ifaz | ] ].
		
	self assert: gClass notNil.
	self assert: gClass type notNil.
	self deny: gClass type equals: 0.
	self assert: gClass typeName equals: name
]

{ #category : #tests }
GClassTest >> testInstallOnNew [
	| gClass name annonClass object |

	name := self randomNameForTest.

	annonClass := GClassForTest newAnonymousSubclass
		setName: name;
		yourself.

	object := annonClass new.
	gClass := GClass gClassAt: annonClass.
	self assert: (gClass interfaces includes: GInterfaceForTest).
	self assert: object gType equals: gClass type
]

{ #category : #tests }
GClassTest >> testNew [
	| name gClass object initialized interfaceInitialized |

	name := self randomNameForTest.
	gClass := 	gClass := GClass 
		install: GClassForTest 
		with: [ :aGClass |
			aGClass
				name: name;
				parent: GtkWidget;
				classInitialize: [ :klass | initialized := true ];
				addInterface: GInterfaceForTest initialize: [ :ifaz | interfaceInitialized := true ] ].
	object := gClass new.	

	self assert: object notNil.
	self assert: object isObject.
	self assert: (object gTypeName: gClass type) equals: name.
	self assert: object gType equals: gClass type.
	self assert: initialized.
	self assert: interfaceInitialized
]

{ #category : #private }
GClassTest >> toByteArray: aNumber size: sizeNumber [
	| result |
	
	result := aNumber asByteArray.
	result size < sizeNumber 
		ifTrue: [ result := (ByteArray new: sizeNumber - result size), result ].
	^ result
]
