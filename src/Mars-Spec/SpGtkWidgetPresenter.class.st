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

{ #category : #documentation }
SpGtkWidgetPresenter class >> documentFactoryMethodSelector [

	^ #newGtkWidget
]

{ #category : #accessing }
SpGtkWidgetPresenter >> widget [
	^ widget
]

{ #category : #accessing }
SpGtkWidgetPresenter >> widget: anObject [
	widget := anObject
]
