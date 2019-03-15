"
https://code.woboq.org/gtk/gtk/gdk/gdkdnd.h.html
/**
 * GdkDragAction:
 * @GDK_ACTION_DEFAULT: Means nothing, and should not be used.
 * @GDK_ACTION_COPY: Copy the data.
 * @GDK_ACTION_MOVE: Move the data, i.e. first copy it, then delete
 *  it from the source using the DELETE target of the X selection protocol.
 * @GDK_ACTION_LINK: Add a link to the data. Note that this is only
 *  useful if source and destination agree on what it means.
 * @GDK_ACTION_PRIVATE: Special action which tells the source that the
 *  destination will do something that the source doesn’t understand.
 * @GDK_ACTION_ASK: Ask the user what to do with the data.
 *
 * Used in #GdkDragContext to indicate what the destination
 * should do with the dropped data.
 */
"
Class {
	#name : #GdkDragAction,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GDK_ACTION_ASK',
		'GDK_ACTION_COPY',
		'GDK_ACTION_DEFAULT',
		'GDK_ACTION_LINK',
		'GDK_ACTION_MOVE',
		'GDK_ACTION_PRIVATE'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'accessing enum' }
GdkDragAction class >> GDK_ACTION_ASK [
	"This method was automatically generated"
	^ GDK_ACTION_ASK
]

{ #category : #'accessing enum' }
GdkDragAction class >> GDK_ACTION_COPY [
	"This method was automatically generated"
	^ GDK_ACTION_COPY
]

{ #category : #'accessing enum' }
GdkDragAction class >> GDK_ACTION_DEFAULT [
	"This method was automatically generated"
	^ GDK_ACTION_DEFAULT
]

{ #category : #'accessing enum' }
GdkDragAction class >> GDK_ACTION_LINK [
	"This method was automatically generated"
	^ GDK_ACTION_LINK
]

{ #category : #'accessing enum' }
GdkDragAction class >> GDK_ACTION_MOVE [
	"This method was automatically generated"
	^ GDK_ACTION_MOVE
]

{ #category : #'accessing enum' }
GdkDragAction class >> GDK_ACTION_PRIVATE [
	"This method was automatically generated"
	^ GDK_ACTION_PRIVATE
]

{ #category : #'enum declaration' }
GdkDragAction class >> enumDecl [
	^  { 
		#GDK_ACTION_DEFAULT . 1 << 0.
	   #GDK_ACTION_COPY    . 1 << 1.
 	   #GDK_ACTION_MOVE    . 1 << 2.
  		#GDK_ACTION_LINK    . 1 << 3.
	   #GDK_ACTION_PRIVATE . 1 << 4.
 	   #GDK_ACTION_ASK     . 1 << 5 
}
]
