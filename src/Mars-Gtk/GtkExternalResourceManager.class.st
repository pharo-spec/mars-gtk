Class {
	#name : #GtkExternalResourceManager,
	#superclass : #FFIExternalResourceManager,
	#category : #'Mars-Gtk-Base'
}

{ #category : #'external resource management' }
GtkExternalResourceManager >> addResource: anObject data: resourceData [
	
	(self includesObject: anObject) ifTrue: [ ^ self ].
	^ super
		addResource: anObject 
		data: resourceData
]

{ #category : #'*Mars-Gtk' }
GtkExternalResourceManager >> includesObject: anObject [

	^ registry includes: anObject
]
