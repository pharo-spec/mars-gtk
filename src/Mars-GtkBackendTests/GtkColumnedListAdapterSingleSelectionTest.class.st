Class {
	#name : #GtkColumnedListAdapterSingleSelectionTest,
	#superclass : #GtkAbstractListAdapterSingleSelectionTest,
	#category : #'Mars-GtkBackendTests'
}

{ #category : #running }
GtkColumnedListAdapterSingleSelectionTest >> classToTest [
	^ TablePresenter
]

{ #category : #running }
GtkColumnedListAdapterSingleSelectionTest >> setUp [

	super setUp.

	window := presenter
		beSingleSelection;
		addColumn: (StringTableColumn evaluated: [:x | x asString ]);
		addColumn: (StringTableColumn evaluated: [:x | (x + 1) asString ]);
		items: #(10 20 30);
		openWithSpec.
]
