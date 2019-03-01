Class {
	#name : #GtkDropListAdapter,
	#superclass : #GtkAbstractListAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkDropListAdapter >> addModelTo: gtkComboBox [
	
	super addModelTo: gtkComboBox.
	
	self setModelTo: gtkComboBox.
	
	gtkComboBox connectChanged: [ 
		self widgetDo: [ :w | 
			self model selectedIndex: w activeIndex + 1 ] ].
	
	self model whenSelectionChanged:  [ gtkComboBox activeIndex: self model selectedIndex - 1  ].
	self model model whenChangedDo: [ 
		self setModelTo: gtkComboBox ]
]

{ #category : #accessing }
GtkDropListAdapter >> displayedIcon [
	
	| selectedIndex |
	selectedIndex := widget activeIndex.
	
	selectedIndex = -1 ifTrue: [ ^ nil ].
	
	self model hasIcons ifFalse: [ ^ nil ].
	
	^ (widget model iteratorFromString: selectedIndex asString) gdkPixbufAt: 0 
]

{ #category : #building }
GtkDropListAdapter >> modelItemsAsDisplay [
	
	^ self model model shownItems collect: [ :each | self model displayForItem: each]
	
]

{ #category : #building }
GtkDropListAdapter >> newTreeStore [

	self model hasIcons 
		ifFalse: [ ^ super newTreeStore ].
		
	^ self newTreeStoreWithIcons
]

{ #category : #building }
GtkDropListAdapter >> newTreeStoreWithIcons [
	
	| store |
	store := GtkTreeStore newColumnTypes: { GType GDK_TYPE_PIXBUF. GType G_TYPE_STRING }.

	self model model shownItems do: [ :each | 
		store appendNew
			at: 0 putObject: (GdkPixbuf newForm: (self model getIconFor: each));
			at: 1 putString: (self model displayForItem: each)].

	^ store
]

{ #category : #accessing }
GtkDropListAdapter >> selectedIndexes [
	
	^ self widget selectedIndexes 
]

{ #category : #building }
GtkDropListAdapter >> setModelTo: gtkComboBox [
	
	| pixbufRenderer textRenderer |
	
	gtkComboBox model: self newTreeStore.
	gtkComboBox activeIndex: self model selectedIndex - 1.

	textRenderer := GtkCellRendererText new.
	
	self model hasIcons ifFalse: [ 
		gtkComboBox
			clear;
			packStart: textRenderer;
			addAttribute:  textRenderer attribute: 'text' column: 0.
		^ self ].


	pixbufRenderer := GtkCellRendererPixbuf new.
	
	gtkComboBox
		clear;
		packStart: pixbufRenderer expand: false;
		packStart: textRenderer;
		addAttribute:  pixbufRenderer attribute: 'pixbuf' column: 0;
		addAttribute:  textRenderer attribute: 'text' column: 1
]

{ #category : #building }
GtkDropListAdapter >> takeKeyboardFocus [ 

	^ self doTakeKeyboardFocus
]

{ #category : #building }
GtkDropListAdapter >> widgetClass [
	
	^ GtkComboBoxText
]
