"
https://www.cs.tut.fi/lintula/manual/gtk/gtk/gtk-drag-and-drop.html#GTKTARGETFLAGS

The GtkTargetFlags enumeration is used to specifies constraints on an entry in a GtkTargetTable.

GTK_TARGET_SAME_APP
If this is set, the target will only be selected for drags within a single application.

GTK_TARGET_SAME_WIDGET
If this is set, the target will only be selected for drags within a single widget.


"
Class {
	#name : #GtkTargetFlags,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_TARGET_SAME_APP',
		'GTK_TARGET_SAME_WIDGET'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'accessing enum' }
GtkTargetFlags class >> GTK_TARGET_SAME_APP [
	"This method was automatically generated"
	^ GTK_TARGET_SAME_APP
]

{ #category : #'accessing enum' }
GtkTargetFlags class >> GTK_TARGET_SAME_WIDGET [
	"This method was automatically generated"
	^ GTK_TARGET_SAME_WIDGET
]

{ #category : #'enum declaration' }
GtkTargetFlags class >> enumDecl [
	^
 {
  #GTK_TARGET_SAME_APP . 1 << 0.
  #GTK_TARGET_SAME_WIDGET  . 1 << 1
} 
]
