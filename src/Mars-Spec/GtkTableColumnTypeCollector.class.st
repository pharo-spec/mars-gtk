Class {
	#name : #GtkTableColumnTypeCollector,
	#superclass : #GtkTableColumnVisitor,
	#instVars : [
		'types'
	],
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #initialization }
GtkTableColumnTypeCollector >> initialize [ 

	super initialize.
	types := OrderedCollection new.
]

{ #category : #accessing }
GtkTableColumnTypeCollector >> types [ 

	^ types asArray
]

{ #category : #visiting }
GtkTableColumnTypeCollector >> visitCheckboxColumn: aTableColumn [

	types add: GType G_TYPE_BOOLEAN
]

{ #category : #visiting }
GtkTableColumnTypeCollector >> visitImageColumn: aTableColumn [

	types add: GType GDK_TYPE_PIXBUF
]

{ #category : #visiting }
GtkTableColumnTypeCollector >> visitStringColumn: aTableColumn [

	types add: GType G_TYPE_STRING
]
