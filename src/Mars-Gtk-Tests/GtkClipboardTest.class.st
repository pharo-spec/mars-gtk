Class {
	#name : #GtkClipboardTest,
	#superclass : #GtkTestCase,
	#instVars : [
		'clipboard'
	],
	#category : #'Mars-Gtk-Tests'
}

{ #category : #running }
GtkClipboardTest >> setUp [
	
	clipboard := GtkClipboard forSelection
]

{ #category : #tests }
GtkClipboardTest >> testText [

	clipboard text: 'Test'.
	self 
		assert: clipboard waitForText 
		equals: 'Test'
]

{ #category : #tests }
GtkClipboardTest >> testWaitForText [

	clipboard clear.
	self assert: clipboard waitForText isNil.
	clipboard text: 'Test'.
	self 
		assert: clipboard waitForText 
		equals: 'Test'	
]
