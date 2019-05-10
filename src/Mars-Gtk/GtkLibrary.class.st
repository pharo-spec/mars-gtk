Class {
	#name : #GtkLibrary,
	#superclass : #FFILibrary,
	#classVars : [
		'Debug'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GtkLibrary class >> beForDebug [
	<script>
	
	Debug := true
]

{ #category : #accessing }
GtkLibrary class >> beForProduction [
	<script>

	Debug := false
]

{ #category : #testing }
GtkLibrary class >> isDebug [ 

	^ Debug ifNil: [ Debug := false ]
]

{ #category : #'accessing platform' }
GtkLibrary >> calloutAPIClass [ 

	^ TFCalloutAPI
]

{ #category : #'accessing platform' }
GtkLibrary >> macModuleName [

	self class isDebug ifTrue: [ ^ '/opt/gtk/inst/lib/libgtk-3.dylib' ]. 
	^ '/usr/local/lib/libgtk-3.dylib'
]

{ #category : #'accessing platform' }
GtkLibrary >> runner [
	
	^ TFSameThreadRunner new
]

{ #category : #'accessing platform' }
GtkLibrary >> unix32ModuleName [ 
	^ '/usr/lib/i386-linux-gnu/libgtk-3.so.0'
]

{ #category : #'accessing platform' }
GtkLibrary >> unix64ModuleName [ 
	^ '/usr/lib/x86_64-linux-gnu/libgtk-3.so.0'
]

{ #category : #'accessing platform' }
GtkLibrary >> win32ModuleName [
	
	^ 'libgtk-3-0.dll'
]
