"
Settings — Sharing settings between applications

https://developer.gnome.org/gtk3/stable/GtkSettings.html
"
Class {
	#name : #GtkSettings,
	#superclass : #GObject,
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

{ #category : #'accessing convenience' }
GtkSettings >> preferDarkTheme [

	^ self propertyBoolean: 'gtk-application-prefer-dark-theme'
]

{ #category : #'accessing convenience' }
GtkSettings >> preferDarkTheme: aBoolean [

	self property: 'gtk-application-prefer-dark-theme' toBoolean: aBoolean
]

{ #category : #accessing }
GtkSettings >> property: aName toBoolean: aBoolean [
	
	self gObjectSet: aName toBoolean: aBoolean
]

{ #category : #accessing }
GtkSettings >> property: aName toString: aString [
	
	self gObjectSet: aName toString: aString
]

{ #category : #accessing }
GtkSettings >> propertyBoolean: aName [
	
	^ self gObjectGetBoolean: aName
]

{ #category : #accessing }
GtkSettings >> propertyString: aName [
	
	^ self gObjectGetString: aName
]

{ #category : #'accessing convenience' }
GtkSettings >> themeName [

	^ self propertyString: 'gtk-theme-name'
]

{ #category : #'accessing convenience' }
GtkSettings >> themeName: aString [
	"GtkSettings default themeName: 'McOS-MJV-Light-1.2'"
	self property: 'gtk-theme-name' toString: aString
]
