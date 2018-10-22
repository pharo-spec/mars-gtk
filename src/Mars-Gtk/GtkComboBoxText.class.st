"
GtkComboBoxText — A simple, text-only combo box

https://developer.gnome.org/gtk3/stable/GtkComboBoxText.html
"
Class {
	#name : #GtkComboBoxText,
	#superclass : #GtkComboBox,
	#category : #'Mars-Gtk-Widget-Input'
}

{ #category : #private }
GtkComboBoxText class >> comboBoxTextNew [ 

	self ffiCall: #(GtkComboBoxText *gtk_combo_box_text_new (void))
]

{ #category : #'instance creation' }
GtkComboBoxText class >> new [

	^ self comboBoxTextNew initialize
]

{ #category : #accessing }
GtkComboBoxText >> activeText [

	^ self ffiCall: #(gchar *gtk_combo_box_text_get_active_text (self))
]

{ #category : #accessing }
GtkComboBoxText >> append: text [

	^ self ffiCall: #(void gtk_combo_box_text_append_text (self, const gchar *text)) 
]

{ #category : #accessing }
GtkComboBoxText >> append: text id: id [

	^ self ffiCall: #(void gtk_combo_box_text_append (self, const gchar *id, const gchar *text)) 
]

{ #category : #accessing }
GtkComboBoxText >> insertAt: position text: text [

	self ffiCall: #(void gtk_combo_box_text_insert_text (
		self,
		gint position,
		const gchar *text)) 
]

{ #category : #accessing }
GtkComboBoxText >> insertAt: position text: text id: id [

	self ffiCall: #(void gtk_combo_box_text_insert (
		self,
		gint position,
		const gchar *id,
		const gchar *text)) 
]

{ #category : #accessing }
GtkComboBoxText >> prepend: text [

	^ self ffiCall: #(void gtk_combo_box_text_prepend_text (self, const gchar *text)) 
]

{ #category : #accessing }
GtkComboBoxText >> prepend: text id: id [

	^ self ffiCall: #(void gtk_combo_box_text_prepend (self, const gchar *id, const gchar *text)) 
]

{ #category : #accessing }
GtkComboBoxText >> removeAll [ 

	^ self ffiCall: #(void gtk_combo_box_text_remove_all (self))
]

{ #category : #accessing }
GtkComboBoxText >> removeAt: position [

	^ self ffiCall: #(void gtk_combo_box_text_remove (self, gint position))
]
