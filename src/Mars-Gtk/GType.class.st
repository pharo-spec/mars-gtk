"
Definition of basic tyles from glib

https://github.com/GNOME/glib/blob/cbfa776fc149fcc3e351fbdf68c1a299519f4905/gobject/gtype.h
"
Class {
	#name : #GType,
	#superclass : #SharedPool,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#classVars : [
		'G_TYPE_BOOLEAN',
		'G_TYPE_BOXED',
		'G_TYPE_CHAR',
		'G_TYPE_DOUBLE',
		'G_TYPE_ENUM',
		'G_TYPE_FLAGS',
		'G_TYPE_FLOAT',
		'G_TYPE_FUNDAMENTAL_SHIFT',
		'G_TYPE_INT',
		'G_TYPE_INT64',
		'G_TYPE_INTERFACE',
		'G_TYPE_INVALID',
		'G_TYPE_LONG',
		'G_TYPE_NONE',
		'G_TYPE_OBJECT',
		'G_TYPE_PARAM',
		'G_TYPE_POINTER',
		'G_TYPE_STRING',
		'G_TYPE_UCHAR',
		'G_TYPE_UINT',
		'G_TYPE_UINT64',
		'G_TYPE_ULONG',
		'G_TYPE_VARIANT'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_BOOLEAN [
	^ G_TYPE_BOOLEAN
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_BOXED [
	^ G_TYPE_BOXED
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_CHAR [
	^ G_TYPE_CHAR
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_DOUBLE [
	^ G_TYPE_DOUBLE
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_ENUM [
	^ G_TYPE_ENUM
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_FLAGS [
	^ G_TYPE_FLAGS
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_FLOAT [
	^ G_TYPE_FLOAT
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_FUNDAMENTAL_SHIFT [
	^ G_TYPE_FUNDAMENTAL_SHIFT
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_INT [
	^ G_TYPE_INT
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_INT64 [
	^ G_TYPE_INT64
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_INTERFACE [
	^ G_TYPE_INTERFACE
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_INVALID [
	^ G_TYPE_INVALID
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_LONG [
	^ G_TYPE_LONG
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_NONE [
	^ G_TYPE_NONE
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_OBJECT [
	^ G_TYPE_OBJECT
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_PARAM [
	^ G_TYPE_PARAM
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_POINTER [
	^ G_TYPE_POINTER
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_STRING [
	^ G_TYPE_STRING
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_UCHAR [
	^ G_TYPE_UCHAR
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_UINT [
	^ G_TYPE_UINT
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_UINT64 [
	^ G_TYPE_UINT64
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_ULONG [
	^ G_TYPE_ULONG
]

{ #category : #'as yet unclassified' }
GType class >> G_TYPE_VARIANT [
	^ G_TYPE_VARIANT
]

{ #category : #'library path' }
GType class >> ffiLibraryName [
	^ GtkLibrary
]

{ #category : #initialization }
GType class >> initialize [

	"self initialize"

	G_TYPE_FUNDAMENTAL_SHIFT := 2.
	G_TYPE_INVALID := self makeFundamentalGType: 0.
	G_TYPE_NONE := self makeFundamentalGType: 1.
	G_TYPE_INTERFACE := self makeFundamentalGType: 2.

	"/**
	 * G_TYPE_CHAR:
	 * 
	 * The fundamental type corresponding to #gchar.
	 * The type designated by G_TYPE_CHAR is unconditionally an 8-bit signed integer.
	 * This may or may not be the same type a the C type gchar.
	 */"
	G_TYPE_CHAR := self makeFundamentalGType: 3.


	"/**
	 * G_TYPE_UCHAR:
	 * 
	 * The fundamental type corresponding to #guchar.
	 */"
	G_TYPE_UCHAR := self makeFundamentalGType: 4.

	"/**
	 * G_TYPE_BOOLEAN:
	 * 
	 * The fundamental type corresponding to #gboolean.
	 */"
	G_TYPE_BOOLEAN := self makeFundamentalGType: 5.

	"/**
	 * G_TYPE_INT:
	 * 
	 * The fundamental type corresponding to #gint.
	 */"
	G_TYPE_INT := self makeFundamentalGType: 6.

	"/**
	 * G_TYPE_UINT:
	 * 
	 * The fundamental type corresponding to #guint.
	 */"
	G_TYPE_UINT := self makeFundamentalGType: 7.

	"/**
	 * G_TYPE_LONG:
	 * 
	 * The fundamental type corresponding to #glong.
	 */"
	G_TYPE_LONG := self makeFundamentalGType: 8.
	
	"/**
	 * G_TYPE_ULONG:
	 * 
	 * The fundamental type corresponding to #gulong.
	 */"
	G_TYPE_ULONG := self makeFundamentalGType: 9.
	
	"/**
	 * G_TYPE_INT64:
	 * 
	 * The fundamental type corresponding to #gint64.
	 */"
	G_TYPE_INT64 := self makeFundamentalGType: 10.

	"/**
	 * G_TYPE_UINT64:
	 * 
	 * The fundamental type corresponding to #guint64.
	 */"
	G_TYPE_UINT64 := self makeFundamentalGType: 11.
	
	"/**
	 * G_TYPE_ENUM:
	 * 
	 * The fundamental type from which all enumeration types are derived.
	 */"
	G_TYPE_ENUM := self makeFundamentalGType: 12.
	
	"/**
	 * G_TYPE_FLAGS:
	 * 
	 * The fundamental type from which all flags types are derived.
	 */"
	G_TYPE_FLAGS := self makeFundamentalGType: 13.
	
	"/**
	 * G_TYPE_FLOAT:
	 * 
	 * The fundamental type corresponding to #gfloat.
	 */"
	G_TYPE_FLOAT := self makeFundamentalGType: 14.
	
	"/**
	 * G_TYPE_DOUBLE:
	 * 
	 * The fundamental type corresponding to #gdouble.
	 */"
	G_TYPE_DOUBLE := self makeFundamentalGType: 15.
	
	"/**
	 * G_TYPE_STRING:
	 * 
	 * The fundamental type corresponding to nul-terminated C strings.
	 */"
	G_TYPE_STRING := self makeFundamentalGType: 16.
	
	"/**
	 * G_TYPE_POINTER:
	 * 
	 * The fundamental type corresponding to #gpointer.
	 */"
	G_TYPE_POINTER := self makeFundamentalGType: 17.
	
	"/**
	 * G_TYPE_BOXED:
	 * 
	 * The fundamental type from which all boxed types are derived.
	 */"
	G_TYPE_BOXED := self makeFundamentalGType: 18.
	
	"/**
	 * G_TYPE_PARAM:
	 * 
	 * The fundamental type from which all #GParamSpec types are derived.
	 */"
	G_TYPE_PARAM := self makeFundamentalGType: 19.
	
	"/**
	 * G_TYPE_OBJECT:
	 * 
	 * The fundamental type for #GObject.
	 */"
	G_TYPE_OBJECT := self makeFundamentalGType: 20.

	"/**
	 * G_TYPE_VARIANT:
	 *
	 * The fundamental type corresponding to #GVariant.
	 *
	 * All floating #GVariant instances passed through the #GType system are
	 * consumed.
	 * 
	 * Note that callbacks in closures, and signal handlers
	 * for signals of return type %G_TYPE_VARIANT, must never return floating
	 * variants.
	 *
	 * Note: GLib 2.24 did include a boxed type with this name. It was replaced
	 * with this fundamental type in 2.26.
	 *
	 * Since: 2.26
	 */"
	G_TYPE_VARIANT := self makeFundamentalGType: 21.
]

{ #category : #initialization }
GType class >> makeFundamentalGType: aValue [

	"/**
	 * G_TYPE_MAKE_FUNDAMENTAL:
	 * @x: the fundamental type number.
	 * 
	 * Get the type ID for the fundamental type number @x.
	 * Use g_type_fundamental_next() instead of this macro to create new fundamental 
	 * types.
	 *
	 * Returns: the GType
	 */"
	^ aValue << G_TYPE_FUNDAMENTAL_SHIFT
]
