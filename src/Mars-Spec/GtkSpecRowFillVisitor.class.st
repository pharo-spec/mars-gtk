Class {
	#name : #GtkSpecRowFillVisitor,
	#superclass : #GtkSpecColumnVisitor,
	#instVars : [
		'row',
		'item'
	],
	#category : #'Mars-Spec-Adapter'
}

{ #category : #accessing }
GtkSpecRowFillVisitor >> item [
	
	^ item
]

{ #category : #accessing }
GtkSpecRowFillVisitor >> item: anItem [

	item := anItem
]

{ #category : #accessing }
GtkSpecRowFillVisitor >> row [

	^ row
]

{ #category : #accessing }
GtkSpecRowFillVisitor >> row: aTableRow [

	row := aTableRow
]

{ #category : #visiting }
GtkSpecRowFillVisitor >> visitStringColumn: aTableColumn [
	| value |

	value := (aTableColumn readObject: item) asString.
	self row 
		at: self index - 1
		putString: value
]
