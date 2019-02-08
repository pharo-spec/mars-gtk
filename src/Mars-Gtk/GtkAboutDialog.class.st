"
GtkAboutDialog
GtkAboutDialog — Display information about an application

https://developer.gnome.org/gtk3/stable/GtkAboutDialog.html
"
Class {
	#name : #GtkAboutDialog,
	#superclass : #GtkDialog,
	#category : #'Mars-Gtk-Widget-Window'
}

{ #category : #private }
GtkAboutDialog class >> gtkDialogNew [

	^ self ffiCall: #(GtkAboutDialog *gtk_about_dialog_new (void))
]

{ #category : #private }
GtkAboutDialog >> basicComments [

	^ self ffiCall: #(String gtk_about_dialog_get_comments (self))
]

{ #category : #private }
GtkAboutDialog >> basicComments: utf8EncodedString [

	^ self ffiCall: #(void gtk_about_dialog_set_comments (self, String utf8EncodedString))
]

{ #category : #private }
GtkAboutDialog >> basicCopyright [

	^ self ffiCall: #(String gtk_about_dialog_get_copyright (self))
]

{ #category : #private }
GtkAboutDialog >> basicCopyright: utf8EncodedString [

	^ self ffiCall: #(void gtk_about_dialog_set_copyright (self, String utf8EncodedString))
]

{ #category : #private }
GtkAboutDialog >> basicLicence [

	^ self ffiCall: #(String gtk_about_dialog_get_license (self))
]

{ #category : #private }
GtkAboutDialog >> basicLicence: utf8EncodedString [

	^ self ffiCall: #(void gtk_about_dialog_set_license (self, String utf8EncodedString))
]

{ #category : #private }
GtkAboutDialog >> basicProgramName [

	^ self ffiCall: #(String gtk_about_dialog_get_program_name (self))
]

{ #category : #private }
GtkAboutDialog >> basicProgramName: utf8EncodedProgramName [

	^ self ffiCall: #(void gtk_about_dialog_set_program_name (self, String utf8EncodedProgramName))
]

{ #category : #private }
GtkAboutDialog >> basicVersion [

	^ self ffiCall: #(String gtk_about_dialog_get_version (self))
]

{ #category : #private }
GtkAboutDialog >> basicVersion: utf8EncodedVersion [

	^ self ffiCall: #(void gtk_about_dialog_get_version (self, String utf8EncodedVersion))
]

{ #category : #private }
GtkAboutDialog >> basicWebsite [

	^ self ffiCall: #(String gtk_about_dialog_get_website (self))
]

{ #category : #private }
GtkAboutDialog >> basicWebsite: utf8EncodedVersion [

	^ self ffiCall: #(void gtk_about_dialog_set_website (self, String utf8EncodedVersion))
]

{ #category : #private }
GtkAboutDialog >> basicWebsiteLabel [

	^ self ffiCall: #(String gtk_about_dialog_get_website_label (self))
]

{ #category : #private }
GtkAboutDialog >> basicWebsiteLabel: utf8EncodedVersion [

	^ self ffiCall: #(void gtk_about_dialog_set_website_label (self, String utf8EncodedVersion))
]

{ #category : #accessing }
GtkAboutDialog >> comments [

	^ self basicComments asByteArray utf8Decoded
]

{ #category : #accessing }
GtkAboutDialog >> comments: aString [

	self basicComments: aString utf8Encoded asString
]

{ #category : #accessing }
GtkAboutDialog >> copyright [

	^ self basicCopyright asByteArray utf8Decoded
]

{ #category : #accessing }
GtkAboutDialog >> copyright: aString [

	self basicCopyright: aString utf8Encoded asString
]

{ #category : #accessing }
GtkAboutDialog >> doNotWrapLicence [
	
	^ self wrapLicence: false
]

{ #category : #accessing }
GtkAboutDialog >> licence [

	^ self basicLicence asByteArray utf8Decoded
]

{ #category : #accessing }
GtkAboutDialog >> licence: aString [

	self basicLicence: aString utf8Encoded asString
]

{ #category : #accessing }
GtkAboutDialog >> programName [

	^ self basicProgramName asByteArray utf8Decoded
]

{ #category : #accessing }
GtkAboutDialog >> programName: aString [

	self basicProgramName: aString utf8Encoded asString
]

{ #category : #accessing }
GtkAboutDialog >> version [

	^ self basicVersion asByteArray utf8Decoded
]

{ #category : #accessing }
GtkAboutDialog >> version: aString [

	self basicVersion: aString utf8Encoded asString
]

{ #category : #accessing }
GtkAboutDialog >> website [

	^ self basicWebsite asByteArray utf8Decoded
]

{ #category : #accessing }
GtkAboutDialog >> website: aString [

	self basicWebsite: aString utf8Encoded asString
]

{ #category : #accessing }
GtkAboutDialog >> websiteLabel [

	^ self basicWebsiteLabel asByteArray utf8Decoded
]

{ #category : #accessing }
GtkAboutDialog >> websiteLabel: aString [

	self basicWebsiteLabel: aString utf8Encoded asString
]

{ #category : #accessing }
GtkAboutDialog >> wrapLicence [
	
	^ self wrapLicence: true
]

{ #category : #accessing }
GtkAboutDialog >> wrapLicence: aBoolean [

	^ self ffiCall: #(void gtk_about_dialog_set_wrap_license (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkAboutDialog >> wrapsLicence [

	^ self ffiCall: #(gboolean gtk_about_dialog_get_wrap_license (self))
]
