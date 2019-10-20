Class {
	#name : #GtkLibrary,
	#superclass : #FFILibrary,
	#classVars : [
		'Debug'
	],
	#pools : [
		'GtkTypes'
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

{ #category : #private }
GtkLibrary >> getMajorVersion [

	^ self ffiCall: #(guint gtk_get_major_version (void))
]

{ #category : #private }
GtkLibrary >> getMicroVersion [

	^ self ffiCall: #(guint gtk_get_micro_version (void))
]

{ #category : #private }
GtkLibrary >> getMinorVersion [

	^ self ffiCall: #(guint gtk_get_minor_version (void))
]

{ #category : #'accessing platform' }
GtkLibrary >> macLibraryName [

	self class isDebug ifTrue: [ ^ '/Users/gtk3/gtk/inst/lib/libgtk-3.dylib' ]. 
	^ '/usr/local/lib/libgtk-3.dylib'
]

{ #category : #utils }
GtkLibrary >> matchVersion: aString ifTrue: trueBlock ifFalse: falseBlock [ 
	| version match |
	
	version := (aString substrings: '.') collect: #asNumber.
	match := self 
		matchVersionMajor: version first
		minor: version second
		micro: version third.
	
	"if null, everything is ok"
	^ (match isNil or: [ match isNull ]) 
		ifTrue: trueBlock
		ifFalse: falseBlock
]

{ #category : #private }
GtkLibrary >> matchVersionMajor: required_major minor: required_minor micro: required_micro [ 
	
	"I use void * to prevent the FFI backend to free the string"
	^ self ffiCall: #("char *"void *gtk_check_version (
		guint required_major,
		guint required_minor,
		guint required_micro))
]

{ #category : #'accessing platform' }
GtkLibrary >> runner [
	
	^ TFSameThreadRunner new
]

{ #category : #'accessing platform' }
GtkLibrary >> unix32LibraryName [ 
	^ '/usr/lib/i386-linux-gnu/libgtk-3.so.0'
]

{ #category : #'accessing platform' }
GtkLibrary >> unix64LibraryName [ 
	^ '/usr/lib/x86_64-linux-gnu/libgtk-3.so.0'
]

{ #category : #accessing }
GtkLibrary >> version [

	^ '{1}.{2}.{3}' format: { 
		self getMajorVersion. 
		self getMinorVersion.
		self getMicroVersion }
]

{ #category : #'accessing platform' }
GtkLibrary >> win32LibraryName [
	
	^ 'libgtk-3-0.dll'
]
