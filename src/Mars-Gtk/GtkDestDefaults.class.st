"
https://code.woboq.org/gtk/gtk/gtk/gtkdragdest.h.html
**
 * GtkDestDefaults:
 * @GTK_DEST_DEFAULT_MOTION: If set for a widget, GTK+, during a drag over this
 *   widget will check if the drag matches this widget’s list of possible targets
 *   and actions.
 *   GTK+ will then call gdk_drag_status() as appropriate.
 * @GTK_DEST_DEFAULT_HIGHLIGHT: If set for a widget, GTK+ will draw a highlight on
 *   this widget as long as a drag is over this widget and the widget drag format
 *   and action are acceptable.
 * @GTK_DEST_DEFAULT_DROP: If set for a widget, when a drop occurs, GTK+ will
 *   will check if the drag matches this widget’s list of possible targets and
 *   actions. If so, GTK+ will call gtk_drag_get_data() on behalf of the widget.
 *   Whether or not the drop is successful, GTK+ will call gtk_drag_finish(). If
 *   the action was a move, then if the drag was successful, then %TRUE will be
 *   passed for the @delete parameter to gtk_drag_finish().
 * @GTK_DEST_DEFAULT_ALL: If set, specifies that all default actions should
 *   be taken.
 *
 * The #GtkDestDefaults enumeration specifies the various
 * types of action that will be taken on behalf
 * of the user for a drag destination site.
 */
"
Class {
	#name : #GtkDestDefaults,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_DEST_DEFAULT_ALL',
		'GTK_DEST_DEFAULT_DROP',
		'GTK_DEST_DEFAULT_HIGHLIGHT',
		'GTK_DEST_DEFAULT_MOTION'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'accessing enum' }
GtkDestDefaults class >> GTK_DEST_DEFAULT_ALL [
	"This method was automatically generated"
	^ GTK_DEST_DEFAULT_ALL
]

{ #category : #'accessing enum' }
GtkDestDefaults class >> GTK_DEST_DEFAULT_DROP [
	"This method was automatically generated"
	^ GTK_DEST_DEFAULT_DROP
]

{ #category : #'accessing enum' }
GtkDestDefaults class >> GTK_DEST_DEFAULT_HIGHLIGHT [
	"This method was automatically generated"
	^ GTK_DEST_DEFAULT_HIGHLIGHT
]

{ #category : #'accessing enum' }
GtkDestDefaults class >> GTK_DEST_DEFAULT_MOTION [
	"This method was automatically generated"
	^ GTK_DEST_DEFAULT_MOTION
]

{ #category : #'enum declaration' }
GtkDestDefaults class >> enumDecl [
	^ {
  #GTK_DEST_DEFAULT_MOTION    . 1 << 0.
  #GTK_DEST_DEFAULT_HIGHLIGHT  . 1 << 1.
  #GTK_DEST_DEFAULT_DROP       . 1 << 2.
  #GTK_DEST_DEFAULT_ALL        . 16r07
} 
]
