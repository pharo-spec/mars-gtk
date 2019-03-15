Class {
	#name : #PangoStyle,
	#superclass : #GtkEnumeration,
	#classVars : [
		'PANGO_WEIGHT_BOLD',
		'PANGO_WEIGHT_BOOK',
		'PANGO_WEIGHT_HEAVY',
		'PANGO_WEIGHT_LIGHT',
		'PANGO_WEIGHT_MEDIUM',
		'PANGO_WEIGHT_NORMAL',
		'PANGO_WEIGHT_SEMIBOLD',
		'PANGO_WEIGHT_SEMILIGHT',
		'PANGO_WEIGHT_THIN',
		'PANGO_WEIGHT_ULTRABOLD',
		'PANGO_WEIGHT_ULTRAHEAVY',
		'PANGO_WEIGHT_ULTRALIGHT'
	],
	#category : #'Mars-Gtk-Styles'
}

{ #category : #'accessing enum' }
PangoStyle class >> PANGO_WEIGHT_BOLD [
	"This method was automatically generated"
	^ PANGO_WEIGHT_BOLD
]

{ #category : #'accessing enum' }
PangoStyle class >> PANGO_WEIGHT_BOOK [
	"This method was automatically generated"
	^ PANGO_WEIGHT_BOOK
]

{ #category : #'accessing enum' }
PangoStyle class >> PANGO_WEIGHT_HEAVY [
	"This method was automatically generated"
	^ PANGO_WEIGHT_HEAVY
]

{ #category : #'accessing enum' }
PangoStyle class >> PANGO_WEIGHT_LIGHT [
	"This method was automatically generated"
	^ PANGO_WEIGHT_LIGHT
]

{ #category : #'accessing enum' }
PangoStyle class >> PANGO_WEIGHT_MEDIUM [
	"This method was automatically generated"
	^ PANGO_WEIGHT_MEDIUM
]

{ #category : #'accessing enum' }
PangoStyle class >> PANGO_WEIGHT_NORMAL [
	"This method was automatically generated"
	^ PANGO_WEIGHT_NORMAL
]

{ #category : #'accessing enum' }
PangoStyle class >> PANGO_WEIGHT_SEMIBOLD [
	"This method was automatically generated"
	^ PANGO_WEIGHT_SEMIBOLD
]

{ #category : #'accessing enum' }
PangoStyle class >> PANGO_WEIGHT_SEMILIGHT [
	"This method was automatically generated"
	^ PANGO_WEIGHT_SEMILIGHT
]

{ #category : #'accessing enum' }
PangoStyle class >> PANGO_WEIGHT_THIN [
	"This method was automatically generated"
	^ PANGO_WEIGHT_THIN
]

{ #category : #'accessing enum' }
PangoStyle class >> PANGO_WEIGHT_ULTRABOLD [
	"This method was automatically generated"
	^ PANGO_WEIGHT_ULTRABOLD
]

{ #category : #'accessing enum' }
PangoStyle class >> PANGO_WEIGHT_ULTRAHEAVY [
	"This method was automatically generated"
	^ PANGO_WEIGHT_ULTRAHEAVY
]

{ #category : #'accessing enum' }
PangoStyle class >> PANGO_WEIGHT_ULTRALIGHT [
	"This method was automatically generated"
	^ PANGO_WEIGHT_ULTRALIGHT
]

{ #category : #'enum declaration' }
PangoStyle class >> enumDecl [

	^ #(
  PANGO_WEIGHT_THIN 			100
  PANGO_WEIGHT_ULTRALIGHT 	200
  PANGO_WEIGHT_LIGHT 			300
  PANGO_WEIGHT_SEMILIGHT 	350
  PANGO_WEIGHT_BOOK 			380
  PANGO_WEIGHT_NORMAL 		400
  PANGO_WEIGHT_MEDIUM 		500
  PANGO_WEIGHT_SEMIBOLD 		600
  PANGO_WEIGHT_BOLD 			700
  PANGO_WEIGHT_ULTRABOLD 	800
  PANGO_WEIGHT_HEAVY 			900
  PANGO_WEIGHT_ULTRAHEAVY 	1000	)
]
