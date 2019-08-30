Class {
	#name : #GClassBuilderTest,
	#superclass : #TestCase,
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #tests }
GClassBuilderTest >> testExtendGObject [

	GClassBuilder new 
		name: 'GTestClass';
		parent: GObject;
		install. 
]
