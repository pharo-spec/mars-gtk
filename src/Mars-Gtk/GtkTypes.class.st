"
I contain gtk types.
"
Class {
	#name : #GtkTypes,
	#superclass : #SharedPool,
	#classVars : [
		'GQuark',
		'GType',
		'gboolean',
		'gchar',
		'gdouble',
		'gint',
		'gint8',
		'gpointer',
		'gsize',
		'gssize',
		'guint',
		'guint32',
		'gulong',
		'gunichar'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #'class initialization' }
GtkTypes class >> initialize [
	gchar 	:= #char.
	gpointer := #'void *'.
	gboolean := #Boolean.
	gulong :=  #ulong.
	gint := #int.
	gint8 := #int8.
	guint := #uint.
	guint32 := #uint32.
	gdouble := #double.
	GQuark := #guint32.
	GType := #gsize.
	gssize := #long.
	gsize := #ulong.
	
	gunichar := #guint32.
]
