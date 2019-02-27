Class {
	#name : #GtkStyleContext,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Styles'
}

{ #category : #accessing }
GtkStyleContext >> addClass: class_name [

	^ self ffiCall: #(void gtk_style_context_add_class (self, const gchar *class_name))
]

{ #category : #accessing }
GtkStyleContext >> fontNormal [

	^ self getFont: GTK_STATE_FLAG_NORMAL 
]

{ #category : #private }
GtkStyleContext >> getFont: state [
	
	^ self ffiCall: #(PangoFontDescription *gtk_style_context_get_font (self, GtkStateFlags state))
]

{ #category : #accessing }
GtkStyleContext >> removeClass: class_name [

	^ self ffiCall: #(void gtk_style_context_remove_class (self, const gchar *class_name))
]
