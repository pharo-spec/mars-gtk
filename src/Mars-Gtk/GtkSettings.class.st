Class {
	#name : #GtkSettings,
	#superclass : #FFIOpaqueObject,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#category : #'Mars-Gtk-Misc'
}

{ #category : #accessing }
GtkSettings class >> default [

	^ self gtkSettingsGetDefault
]

{ #category : #'library path' }
GtkSettings class >> ffiLibraryName [
	^ GtkLibrary
]

{ #category : #private }
GtkSettings class >> gtkSettingsGetDefault [

	^ self ffiCall: #(GtkSettings *gtk_settings_get_default (void))
]

{ #category : #initialization }
GtkSettings >> initialize [
	
]
