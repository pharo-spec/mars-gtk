"
The “draw” signal

gboolean
user_function (GtkWidget    *widget,
               CairoContext *cr,
               gpointer      user_data)

This signal is emitted when a widget is supposed to render itself. The widget 's top left corner must be painted at the origin of the passed in context and be sized to the values returned by gtk_widget_get_allocated_width() and gtk_widget_get_allocated_height().
Signal handlers connected to this signal can modify the cairo context passed as cr in any way they like and don't need to restore it. The signal emission takes care of calling cairo_save() before and cairo_restore() after invoking the handler.
The signal handler will get a cr with a clip region already set to the widget's dirty region, i.e. to the area that needs repainting. Complicated widgets that want to avoid redrawing themselves completely can get the full extents of the clip region with gdk_cairo_get_clip_rectangle(), or they can get a finer-grained representation of the dirty region with cairo_copy_clip_rectangle_list().
"
Class {
	#name : #GDrawCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #accessing }
GDrawCallback class >> signalName [

	^ 'draw'
]

{ #category : #accessing }
GDrawCallback >> do: aBlock [

	^ super do: [ :widget :cr :payload |
		aBlock value: cr  ]
]

{ #category : #accessing }
GDrawCallback >> signature [

	^ #(gboolean (void *widget, void *cr, void *payload))
]
