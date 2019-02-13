Class {
	#name : #GtkButtonAdapterTest,
	#superclass : #GtkAdapterTestCase,
	#category : #'Mars-GtkBackendTests'
}

{ #category : #running }
GtkButtonAdapterTest >> classToTest [

	^ ButtonPresenter
]

{ #category : #utils }
GtkButtonAdapterTest >> emulateLeftClick [
	presenter adapter widget clicked
]

{ #category : #running }
GtkButtonAdapterTest >> testChangingHelpAffectTheWidget [
	
	presenter help: 'ALabel'.

	self openInstance.

	self assert: presenter adapter widget tooltipText equals: 'ALabel'
]

{ #category : #running }
GtkButtonAdapterTest >> testChangingHelpAffectTheWidgetAfterConstruction [
	
	self openInstance.

	presenter help: 'ALabel'.

	self assert: presenter adapter widget tooltipText equals: 'ALabel'
]

{ #category : #running }
GtkButtonAdapterTest >> testChangingIconAffectTheWidget [


	presenter iconName: #pharo.

	self openInstance.

	self deny: presenter adapter widget image isNull
]

{ #category : #running }
GtkButtonAdapterTest >> testChangingIconAffectTheWidgetAfterConstruction [

	self openInstance.

	self assert: presenter adapter widget image isNull.
	
	presenter iconName: #pharo.

	self deny: presenter adapter widget image isNull
]

{ #category : #running }
GtkButtonAdapterTest >> testChangingLabelAffectTheWidget [
	
	presenter label: 'ALabel'.

	self openInstance.

	self assert: presenter adapter widget label equals: 'ALabel'
]

{ #category : #running }
GtkButtonAdapterTest >> testChangingLabelAffectTheWidgetAfterConstruction [
	
	self openInstance.

	presenter label: 'ALabel'.

	self assert: presenter adapter widget label equals: 'ALabel'
]

{ #category : #running }
GtkButtonAdapterTest >> testClickExecuteAction [
	| actionExecuted |
	
	actionExecuted := false.
	
	presenter action: [ actionExecuted := true].

	self openInstance.
		
	self emulateLeftClick.
	
	self assert: actionExecuted.	

]
