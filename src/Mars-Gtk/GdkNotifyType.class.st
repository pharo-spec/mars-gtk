Class {
	#name : #GdkNotifyType,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GDK_NOTIFY_ANCESTOR',
		'GDK_NOTIFY_INFERIOR',
		'GDK_NOTIFY_NONLINEAR',
		'GDK_NOTIFY_NONLINEAR_VIRTUAL',
		'GDK_NOTIFY_UNKNOWN',
		'GDK_NOTIFY_VIRTUAL'
	],
	#category : #'Mars-Gtk-Base-Events'
}

{ #category : #'accessing enum' }
GdkNotifyType class >> GDK_NOTIFY_ANCESTOR [
	"This method was automatically generated"
	^ GDK_NOTIFY_ANCESTOR
]

{ #category : #'accessing enum' }
GdkNotifyType class >> GDK_NOTIFY_INFERIOR [
	"This method was automatically generated"
	^ GDK_NOTIFY_INFERIOR
]

{ #category : #'accessing enum' }
GdkNotifyType class >> GDK_NOTIFY_NONLINEAR [
	"This method was automatically generated"
	^ GDK_NOTIFY_NONLINEAR
]

{ #category : #'accessing enum' }
GdkNotifyType class >> GDK_NOTIFY_NONLINEAR_VIRTUAL [
	"This method was automatically generated"
	^ GDK_NOTIFY_NONLINEAR_VIRTUAL
]

{ #category : #'accessing enum' }
GdkNotifyType class >> GDK_NOTIFY_UNKNOWN [
	"This method was automatically generated"
	^ GDK_NOTIFY_UNKNOWN
]

{ #category : #'accessing enum' }
GdkNotifyType class >> GDK_NOTIFY_VIRTUAL [
	"This method was automatically generated"
	^ GDK_NOTIFY_VIRTUAL
]

{ #category : #'enum declaration' }
GdkNotifyType class >> enumDecl [
	"self initializeEnumeration; rebuildEnumAccessors"
	
	^ #(
		GDK_NOTIFY_ANCESTOR            0
		GDK_NOTIFY_VIRTUAL             1
		GDK_NOTIFY_INFERIOR            2
		GDK_NOTIFY_NONLINEAR           3
		GDK_NOTIFY_NONLINEAR_VIRTUAL   4
		GDK_NOTIFY_UNKNOWN	             5
	)
]
