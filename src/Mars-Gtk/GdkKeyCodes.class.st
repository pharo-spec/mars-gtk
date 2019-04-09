"
Key codes of the gtk platform (just the ones needed). 
They can be found at: gdk/gdkkeysyms.h
"
Class {
	#name : #GdkKeyCodes,
	#superclass : #SharedPool,
	#classVars : [
		'KEY_Begin',
		'KEY_Break',
		'KEY_Cancel',
		'KEY_Down',
		'KEY_End',
		'KEY_Escape',
		'KEY_Execute',
		'KEY_Find',
		'KEY_Help',
		'KEY_Home',
		'KEY_Insert',
		'KEY_Left',
		'KEY_Menu',
		'KEY_Mode_switch',
		'KEY_Next',
		'KEY_Num_Lock',
		'KEY_Page_Down',
		'KEY_Page_Up',
		'KEY_Print',
		'KEY_Prior',
		'KEY_Redo',
		'KEY_Right',
		'KEY_Select',
		'KEY_Undo',
		'KEY_Up',
		'KEY_script_switch'
	],
	#category : #'Mars-Gtk-Base-Events'
}

{ #category : #'class initialization' }
GdkKeyCodes class >> initialize [ 

	KEY_Escape 	:= 16rff1b.
	KEY_Home := 16rff50.
	KEY_Left := 16rff51.
	KEY_Up := 16rff52.
	KEY_Right := 16rff53.
	KEY_Down := 16rff54.
	KEY_Prior := 16rff55.
	KEY_Page_Up := 16rff55.
	KEY_Next := 16rff56.
	KEY_Page_Down := 16rff56.
	KEY_End := 16rff57.
	KEY_Begin := 16rff58.
	KEY_Select := 16rff60.
	KEY_Print := 16rff61.
	KEY_Execute := 16rff62.
	KEY_Insert := 16rff63.
	KEY_Undo := 16rff65.
	KEY_Redo := 16rff66.
	KEY_Menu := 16rff67.
	KEY_Find := 16rff68.
	KEY_Cancel := 16rff69.
	KEY_Help := 16rff6a.
	KEY_Break := 16rff6b.
	KEY_Mode_switch := 16rff7e.
	KEY_script_switch := 16rff7e.
	KEY_Num_Lock := 16rff7f.

]
