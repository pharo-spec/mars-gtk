Class {
	#name : #GtkPopoverAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkPopoverAdapter >> addModelTo: gtkPopover [

	gtkPopover add: self presenterWidget showAll.	
	gtkPopover beRelativeTo: self presenter owner adapter innerWidget. 
	self setPopoverDirectionTo: gtkPopover.
	
	self presenter whenPresenterChangedDo: [
		gtkPopover 
			removeAll;
			add: self presenterWidget show ] 
]

{ #category : #building }
GtkPopoverAdapter >> buildWidget [
	
	^ super buildWidget autoRelease
]

{ #category : #api }
GtkPopoverAdapter >> popup [

	self widgetDo: [ :w | w popup ]
]

{ #category : #api }
GtkPopoverAdapter >> popupPointingTo: aRectangle [

	self widgetDo: [ :w | 
		w 
			setPointingTo: aRectangle asGdkRectangle;
			popup ]
]

{ #category : #building }
GtkPopoverAdapter >> presenterWidget [

	^ self presenter presenter buildWithSpec
]

{ #category : #building }
GtkPopoverAdapter >> setPopoverDirectionTo: gtkPopover [
		
	
]

{ #category : #building }
GtkPopoverAdapter >> widgetClass [

	^ GtkPopover
]
