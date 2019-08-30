Class {
	#name : #GClassBuilderTest,
	#superclass : #TestCase,
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #tests }
GClassBuilderTest >> testExtendGObject [
	| gClass |

	gClass := GClassBuilder build: [ :builder |
		builder 
			name: 'TestGObject';
			parent: GObject ].
		
	gClass gType crLog.
	self assert: gClass gType notNil
]
