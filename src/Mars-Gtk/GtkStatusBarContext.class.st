"
Convenience class that represents the context of a status bar.
"
Class {
	#name : #GtkStatusBarContext,
	#superclass : #Object,
	#instVars : [
		'bar',
		'name',
		'id'
	],
	#category : #'Mars-Gtk-Widget-Display'
}

{ #category : #accessing }
GtkStatusBarContext >> bar [
	^ bar
]

{ #category : #accessing }
GtkStatusBarContext >> bar: anObject [
	bar := anObject
]

{ #category : #accessing }
GtkStatusBarContext >> id [
	^ id
]

{ #category : #accessing }
GtkStatusBarContext >> id: anObject [
	id := anObject
]

{ #category : #accessing }
GtkStatusBarContext >> name [
	^ name
]

{ #category : #accessing }
GtkStatusBarContext >> name: anObject [
	name := anObject
]

{ #category : #accessing }
GtkStatusBarContext >> popMessage [

	bar popFromContextId: id
]

{ #category : #accessing }
GtkStatusBarContext >> pushMessage: text [

	^ GtkStatusBarMessage new
		text: text;
		context: self;
		id: (bar pushMessage: text withId: id);
		yourself
]

{ #category : #accessing }
GtkStatusBarContext >> removeAll [

	bar removeAllFromContextId: id
]

{ #category : #accessing }
GtkStatusBarContext >> removeMessageWithId: messageId [

	bar removeMessageWithId: messageId fromContextId: id
]
