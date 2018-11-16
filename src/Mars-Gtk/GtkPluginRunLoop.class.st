Class {
	#name : #GtkPluginRunLoop,
	#superclass : #GtkRunLoop,
	#instVars : [
		'inputSemaphore',
		'semaIndex'
	],
	#category : 'Mars-Gtk-Base'
}

{ #category : #testing }
GtkPluginRunLoop class >> hasPlugin [
	<primitive: #primitiveHasDisplayPlugin module: #Gtk3DisplayPlugin>
	^ false
]

{ #category : #initialization }
GtkPluginRunLoop >> initialize [
	super initialize.
	inputSemaphore := Semaphore new.

]

{ #category : #'private installing' }
GtkPluginRunLoop >> installRunLoop [
	semaIndex := Smalltalk registerExternalObject: inputSemaphore.
	self primEnableGtk3EventHandler: semaIndex.
	[
		[ inputSemaphore wait; consumeAllSignals. session == Smalltalk session ] 
		whileTrue: [ self processEvents ]
	] ensure:  [ Smalltalk unregisterExternalObject: inputSemaphore ]
]

{ #category : #'private primitives' }
GtkPluginRunLoop >> primDisableGtk3EventHandler [
	"<primitive: #primitiveDisableGtk3EventHandler module: #Gtk3DisplayPlugin>
	self primitiveFailed"
]

{ #category : #'private primitives' }
GtkPluginRunLoop >> primEnableGtk3EventHandler: index [
	<primitive: #primitiveEnableGtk3EventHandler module: #Gtk3DisplayPlugin>
	self primitiveFailed
]

{ #category : #initialization }
GtkPluginRunLoop >> start [

	running := true
]

{ #category : #initialization }
GtkPluginRunLoop >> stop [

	running := false
]

{ #category : #'private installing' }
GtkPluginRunLoop >> uninstallRunLoop [
	self primDisableGtk3EventHandler
]
