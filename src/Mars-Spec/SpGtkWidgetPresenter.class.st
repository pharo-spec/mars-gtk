Class {
	#name : #SpGtkWidgetPresenter,
	#superclass : #SpAbstractWidgetPresenter,
	#instVars : [
		'widget'
	],
	#category : #'Mars-Spec-Widgets'
}

{ #category : #specs }
SpGtkWidgetPresenter class >> adapterName [

	^ #GtkWidgetAdapter
]

{ #category : #accessing }
SpGtkWidgetPresenter >> widget [
	^ widget
]

{ #category : #accessing }
SpGtkWidgetPresenter >> widget: anObject [
	widget := anObject
]
