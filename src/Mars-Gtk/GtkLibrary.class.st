Class {
	#name : #GtkLibrary,
	#superclass : #FFILibrary,
	#category : 'Mars-Gtk-Base'
}

{ #category : #'accessing platform' }
GtkLibrary >> macModuleName [

	"^ '/opt/gtk/inst/lib/libgtk-3.dylib'" 
	^ '/usr/local/lib/libgtk-3.dylib'
]

{ #category : #accessing }
GtkLibrary >> options [ 
	"dispatch to a queue (because there will be a runloop someplace there)"
	^ super options
	"^ #(optQueue:'org.pharo.Gtk')"
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
GtkLibrary >> workerName [

	^ #GTK
]
