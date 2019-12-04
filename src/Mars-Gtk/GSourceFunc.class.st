"
GSourceFunc ()
gboolean
(*GSourceFunc) (gpointer user_data);

Specifies the type of function passed to g_timeout_add(), g_timeout_add_full(), g_idle_add(), and g_idle_add_full().
When calling g_source_set_callback(), you may need to cast a function of a different type to this type. Use G_SOURCE_FUNC() to avoid warnings about incompatible function types.

https://developer.gnome.org/glib/stable/glib-The-Main-Event-Loop.html#GSourceFunc
"
Class {
	#name : #GSourceFunc,
	#superclass : #GCallback,
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #'instance creation' }
GSourceFunc class >> do: aBlock [

	^ self 
		signature: #(guint (void *data))
		block: [ :data | 
			aBlock value. 
			0 ]
]
