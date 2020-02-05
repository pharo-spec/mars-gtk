"
GtkToolButton — A GtkToolItem subclass that displays buttons

https://developer.gnome.org/gtk3/stable/GtkToolButton.html
"
Class {
	#name : #GtkToolButton,
	#superclass : #GtkToolItem,
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

{ #category : #'as yet unclassified' }
GtkToolButton >> iconWidget [

	self ffiCall: #(GtkWidget *gtk_tool_button_get_icon_widget (self))
]

{ #category : #'as yet unclassified' }
GtkToolButton >> iconWidget: icon_widget [

	self ffiCall: #(void gtk_tool_button_set_icon_widget (self, GtkWidget *icon_widget))
]

{ #category : #accessing }
GtkToolButton >> label [
	^ self ffiCall: #(const gchar *gtk_tool_button_get_label (self))
]

{ #category : #accessing }
GtkToolButton >> label: label [
	^ self ffiCall: #(void gtk_tool_button_set_label (self, const gchar *label))
]
