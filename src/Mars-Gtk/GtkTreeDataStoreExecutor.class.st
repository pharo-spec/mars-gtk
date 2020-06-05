"
! GtkTreeDataStoreExecutor

A helper to finalize (dispose) cached elements from *class:GtkTreeDataStore*

See *method:GtkTreeStore#registerForFinalize*
"
Class {
	#name : #GtkTreeDataStoreExecutor,
	#superclass : #Object,
	#instVars : [
		'dictionaryList'
	],
	#pools : [
		'GType',
		'GtkTreeModelFlags'
	],
	#category : #'Mars-Gtk-Widget-Tree-Store'
}

{ #category : #accessing }
GtkTreeDataStoreExecutor >> dictionaryList [
	^ dictionaryList
]

{ #category : #accessing }
GtkTreeDataStoreExecutor >> dictionaryList: anObject [
	dictionaryList := anObject
]

{ #category : #finalization }
GtkTreeDataStoreExecutor >> finalize [

	dictionaryList do: [ :eachDictionary | 
		eachDictionary valuesDo: [ :each | each free ] ]
]
