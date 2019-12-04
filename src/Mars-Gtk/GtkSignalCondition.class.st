Class {
	#name : #GtkSignalCondition,
	#superclass : #GtkSignalFilter,
	#instVars : [
		'conditionBlock'
	],
	#category : #'Mars-Gtk-Signal'
}

{ #category : #'instance creation' }
GtkSignalCondition class >> installWhen: aCondition [

	^ self new 
		when: aCondition;
		install
]

{ #category : #'instance creation' }
GtkSignalCondition class >> newWhen: aCondition [

	^ self new when: aCondition
]

{ #category : #initialization }
GtkSignalCondition >> initialize [

	super initialize.
	conditionBlock := [ :aSignal | true ]
]

{ #category : #testing }
GtkSignalCondition >> isFiltered: aSignal [

	^ (conditionBlock value: aSignal) not
]

{ #category : #testing }
GtkSignalCondition >> isFilteredClass: aSignalClass [

	^ true
]

{ #category : #accessing }
GtkSignalCondition >> when: aBlock [ 

	conditionBlock := aBlock
]
