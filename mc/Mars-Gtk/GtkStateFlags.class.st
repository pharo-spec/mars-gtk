"
Describes a widget state. Widget states are used to match the widget against CSS pseudo-classes. Note that GTK extends the regular CSS classes and sometimes uses different names.

https://developer.gnome.org/gtk3/stable/gtk3-Standard-Enumerations.html#GtkStateFlags
"
Class {
	#name : #GtkStateFlags,
	#superclass : #FFIExternalEnumeration,
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
	#category : 'Mars-Gtk-Widget'
}

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
