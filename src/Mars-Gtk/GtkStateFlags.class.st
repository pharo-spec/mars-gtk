"
Describes a widget state. Widget states are used to match the widget against CSS pseudo-classes. Note that GTK extends the regular CSS classes and sometimes uses different names.

https://developer.gnome.org/gtk3/stable/gtk3-Standard-Enumerations.html#GtkStateFlags
"
Class {
	#name : #GtkStateFlags,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_STATE_FLAG_ACTIVE',
		'GTK_STATE_FLAG_BACKDROP',
		'GTK_STATE_FLAG_CHECKED',
		'GTK_STATE_FLAG_DIR_LTR',
		'GTK_STATE_FLAG_DIR_RTL',
		'GTK_STATE_FLAG_DROP_ACTIVE',
		'GTK_STATE_FLAG_FOCUSED',
		'GTK_STATE_FLAG_INCONSISTENT',
		'GTK_STATE_FLAG_INSENSITIVE',
		'GTK_STATE_FLAG_LINK',
		'GTK_STATE_FLAG_NORMAL',
		'GTK_STATE_FLAG_PRELIGHT',
		'GTK_STATE_FLAG_SELECTED',
		'GTK_STATE_FLAG_VISITED'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'accessing enum' }
GtkStateFlags class >> GTK_STATE_FLAG_ACTIVE [
	"This method was automatically generated"
	^ GTK_STATE_FLAG_ACTIVE
]

{ #category : #'accessing enum' }
GtkStateFlags class >> GTK_STATE_FLAG_BACKDROP [
	"This method was automatically generated"
	^ GTK_STATE_FLAG_BACKDROP
]

{ #category : #'accessing enum' }
GtkStateFlags class >> GTK_STATE_FLAG_CHECKED [
	"This method was automatically generated"
	^ GTK_STATE_FLAG_CHECKED
]

{ #category : #'accessing enum' }
GtkStateFlags class >> GTK_STATE_FLAG_DIR_LTR [
	"This method was automatically generated"
	^ GTK_STATE_FLAG_DIR_LTR
]

{ #category : #'accessing enum' }
GtkStateFlags class >> GTK_STATE_FLAG_DIR_RTL [
	"This method was automatically generated"
	^ GTK_STATE_FLAG_DIR_RTL
]

{ #category : #'accessing enum' }
GtkStateFlags class >> GTK_STATE_FLAG_DROP_ACTIVE [
	"This method was automatically generated"
	^ GTK_STATE_FLAG_DROP_ACTIVE
]

{ #category : #'accessing enum' }
GtkStateFlags class >> GTK_STATE_FLAG_FOCUSED [
	"This method was automatically generated"
	^ GTK_STATE_FLAG_FOCUSED
]

{ #category : #'accessing enum' }
GtkStateFlags class >> GTK_STATE_FLAG_INCONSISTENT [
	"This method was automatically generated"
	^ GTK_STATE_FLAG_INCONSISTENT
]

{ #category : #'accessing enum' }
GtkStateFlags class >> GTK_STATE_FLAG_INSENSITIVE [
	"This method was automatically generated"
	^ GTK_STATE_FLAG_INSENSITIVE
]

{ #category : #'accessing enum' }
GtkStateFlags class >> GTK_STATE_FLAG_LINK [
	"This method was automatically generated"
	^ GTK_STATE_FLAG_LINK
]

{ #category : #'accessing enum' }
GtkStateFlags class >> GTK_STATE_FLAG_NORMAL [
	"This method was automatically generated"
	^ GTK_STATE_FLAG_NORMAL
]

{ #category : #'accessing enum' }
GtkStateFlags class >> GTK_STATE_FLAG_PRELIGHT [
	"This method was automatically generated"
	^ GTK_STATE_FLAG_PRELIGHT
]

{ #category : #'accessing enum' }
GtkStateFlags class >> GTK_STATE_FLAG_SELECTED [
	"This method was automatically generated"
	^ GTK_STATE_FLAG_SELECTED
]

{ #category : #'accessing enum' }
GtkStateFlags class >> GTK_STATE_FLAG_VISITED [
	"This method was automatically generated"
	^ GTK_STATE_FLAG_VISITED
]

{ #category : #'enum declaration' }
GtkStateFlags class >> enumDecl [
	^ {
  #GTK_STATE_FLAG_NORMAL.  			0.
  #GTK_STATE_FLAG_ACTIVE. 			1 << 0.
  #GTK_STATE_FLAG_PRELIGHT. 		1 << 1.
  #GTK_STATE_FLAG_SELECTED. 		1 << 2.
  #GTK_STATE_FLAG_INSENSITIVE. 	1 << 3.
  #GTK_STATE_FLAG_INCONSISTENT. 	1 << 4.
  #GTK_STATE_FLAG_FOCUSED. 			1 << 5.
  #GTK_STATE_FLAG_BACKDROP. 		1 << 6.
  #GTK_STATE_FLAG_DIR_LTR. 			1 << 7.
  #GTK_STATE_FLAG_DIR_RTL. 			1 << 8.
  #GTK_STATE_FLAG_LINK. 				1 << 9.
  #GTK_STATE_FLAG_VISITED. 			1 << 10.
  #GTK_STATE_FLAG_CHECKED. 			1 << 11.
  #GTK_STATE_FLAG_DROP_ACTIVE. 	1 << 12
}
]
