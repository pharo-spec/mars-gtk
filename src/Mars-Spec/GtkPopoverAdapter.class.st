Class {
	#name : #GtkPopoverAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkPopoverAdapter >> addModelTo: gtkPopover [

	gtkPopover add: self presenterWidget showAll.	
	gtkPopover beRelativeTo: self presenter owner adapter innerWidget. 
	gtkPopover beModal.
	self setPopoverPositionTo: gtkPopover.
	
	self presenter whenPresenterChangedDo: [
		gtkPopover 
			removeAll;
			add: self presenterWidget showAll ] 
]

{ #category : #building }
GtkPopoverAdapter >> buildWidget [
	
	^ super buildWidget 
		markForAutoRelease;
		canFocus: true
]

{ #category : #api }
GtkPopoverAdapter >> dismiss [ 

	self widgetDo: [ :w | w popdown ]
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
GtkPopoverAdapter >> setPopoverPositionTo: gtkPopover [
		
	^ self presenter position applyTo: gtkPopover
]

{ #category : #building }
GtkPopoverAdapter >> widgetClass [

	^ GtkPopover
]
