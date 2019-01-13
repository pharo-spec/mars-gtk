Class {
	#name : #GtkTableColumnTypeCollector,
	#superclass : #GtkTableColumnVisitor,
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #visiting }
GtkTableColumnTypeCollector >> visitImageColumn: aTableColumn [

	^ GType GDK_TYPE_PIXBUF
]

{ #category : #visiting }
GtkTableColumnTypeCollector >> visitStringColumn: aTableColumn [

	^ GType G_TYPE_STRING
]
