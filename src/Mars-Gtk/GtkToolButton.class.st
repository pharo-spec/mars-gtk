"
GtkToolButton — A GtkToolItem subclass that displays buttons

https://developer.gnome.org/gtk3/stable/GtkToolButton.html
"
Class {
	#name : #GtkToolButton,
	#superclass : #GtkToolItem,
	#instVars : [
		'iconWidget'
	],
	#category : #'Mars-Gtk-Widget-Toolbar'
}

{ #category : #accessing }
GtkToolButton class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_tool_button_get_type())
]

{ #category : #'instance creation' }
GtkToolButton class >> newIcon: aWidget label: aString [

	^ (self 
		toolButtonNew: aWidget 
		label: aString) 
		initialize
]

{ #category : #private }
GtkToolButton class >> toolButtonNew: icon_widget label: label [

	^ self ffiCall: #(GtkToolButton *gtk_tool_button_new (
		GtkWidget *icon_widget,
		const gchar *label))
]

{ #category : #'private primitives' }
GtkToolButton >> gtkIconWidget [

	self ffiCall: #(GtkImage *gtk_tool_button_get_icon_widget (self))
]

{ #category : #'private primitives' }
GtkToolButton >> gtkIconWidget: icon_widget [

	self ffiCall: #(void gtk_tool_button_set_icon_widget (self, GtkImage *icon_widget))
]

{ #category : #accessing }
GtkToolButton >> iconWidget [

	iconWidget ifNil: [ iconWidget := self gtkIconWidget ]
]

{ #category : #accessing }
GtkToolButton >> iconWidget: aGtkWidget [

	iconWidget := aGtkWidget.
	self gtkIconWidget: iconWidget
]

{ #category : #accessing }
GtkToolButton >> label [
	^ self ffiCall: #(const gchar *gtk_tool_button_get_label (self))
]

{ #category : #accessing }
GtkToolButton >> label: label [
	^ self ffiCall: #(void gtk_tool_button_set_label (self, const gchar *label))
]
