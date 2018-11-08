Class {
	#name : #GtkDialogWindowAdapter,
	#superclass : #GtkWindowAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkDialogWindowAdapter >> addModelTo: gtkDialog [

	gtkDialog contentArea 
		packStart: self model contents

]

{ #category : #building }
GtkDialogWindowAdapter >> buildWidget [
	| gtkDialog |

	gtkDialog := GtkDialog new 
		autoRelease
		resize: self model initialExtent;
		yourself.
	self addModelTo: gtkDialog.
	^ gtkDialog
]
