"
GValue 

https://developer.gnome.org/gobject/stable/gobject-Generic-values.html#GValue
"
Class {
	#name : #GValue,
	#superclass : #GBaseObject,
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'library path' }
GValue class >> ffiLibraryName [

	^ GObjectLibrary
]

{ #category : #'library path' }
GValue >> ffiLibraryName [

	^ self class ffiLibraryName
]

{ #category : #accessing }
GValue >> getObject: v_object [ 

	^ self ffiCall: #(gpointer g_value_get_object (self))
]

{ #category : #accessing }
GValue >> init: g_type [

	self ffiCall: #(void *g_value_init (self, gsize g_type))
]

{ #category : #accessing }
GValue >> setDouble: v_double [

	self ffiCall: #(void g_value_set_double (self, gdouble v_double))
]

{ #category : #accessing }
GValue >> setFloat: v_float [

	self ffiCall: #(void g_value_set_float (self, gfloat v_float))
]

{ #category : #accessing }
GValue >> setInt64: v_int64 [

	self ffiCall: #(void g_value_set_int64 (self, gint64 v_int64))
]

{ #category : #accessing }
GValue >> setInt: v_int [

	self ffiCall: #(void g_value_set_int (self, gint v_int))
]

{ #category : #accessing }
GValue >> setLong: v_long [

	self ffiCall: #(void g_value_set_long (self, glong v_long))
]

{ #category : #accessing }
GValue >> setObject: v_object [ 

	^ self ffiCall: #(void g_value_set_object (self, gpointer v_object))
]

{ #category : #accessing }
GValue >> setPointer: v_pointer [

	self ffiCall: #(void g_value_set_pointer (self, gpointer v_pointer))
]

{ #category : #accessing }
GValue >> setSChar: v_char [

	self ffiCall: #(void g_value_set_schar (self, gint8 v_char))
]

{ #category : #accessing }
GValue >> setString: v_string [

	self ffiCall: #(void g_value_set_string (self, const gchar *v_string))
]

{ #category : #accessing }
GValue >> setUChar: u_char [

	self ffiCall: #(void g_value_set_uchar (self, guchar u_char))
]

{ #category : #accessing }
GValue >> setUInt64: v_uint64 [

	self ffiCall: #(void g_value_set_uint64 (self, guint64 v_uint64))
]

{ #category : #accessing }
GValue >> setUInt: u_int [

	self ffiCall: #(void g_value_set_uint (self, guint u_int))
]

{ #category : #accessing }
GValue >> setULong: u_long [

	self ffiCall: #(void g_value_set_ulong (self, gulong u_long))
]
