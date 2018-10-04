"
I contain gtk types.
"
Class {
	#name : #GtkTypes,
	#superclass : #SharedPool,
	#classVars : [
		'GCallback',
		'GQuark',
		'GType',
		'gboolean',
		'gchar',
		'gdouble',
		'gint',
		'gpointer',
		'gsize',
		'gssize',
		'guint',
		'guint32',
		'gulong'
	],
	#category : 'Mars-Gtk-Base'
}

{ #category : #'class initialization' }
GtkTypes class >> initialize [
	gchar 	:= #char.
	gpointer := #'void *'.
	gboolean := #Boolean.
	gulong :=  #ulong.
	gint := #int.
	guint := #uint.
	guint32 := #uint32.
	gdouble := #double.
	GCallback := #FFICallback.
	GQuark := #guint32.
	GType := #gsize.
	gssize := #long.
	gsize := #ulong.
]
