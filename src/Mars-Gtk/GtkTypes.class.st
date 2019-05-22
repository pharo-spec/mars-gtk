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
		'gint16',
		'gint8',
		'gpointer',
		'gsize',
		'gssize',
		'guint',
		'guint16',
		'guint32',
		'guint8',
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
	guint8 := #uint8.
	gint16 := #int16.
	guint16 := #uint16.
	guint := #uint.
	guint32 := #uint32.
	gdouble := #double.
	GQuark := #guint32.
	GType := #gsize.
	gssize := #long.
	gsize := #ulong.
	gint16 := #int16.
	
	gunichar := #guint32.
]
