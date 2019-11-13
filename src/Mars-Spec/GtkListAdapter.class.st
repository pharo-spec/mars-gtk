Class {
	#name : #GtkListAdapter,
	#superclass : #GtkBaseListAdapter,
	#category : #'Mars-Spec-Adapter-List'
}

{ #category : #specs }
GtkListAdapter class >> adaptingAliases [

	^ #(FastTableAdapter)
]

{ #category : #building }
GtkListAdapter >> addModelTo: gtkList [

	super addModelTo: gtkList.

	self model selection isMultipleSelection 
		ifTrue: [ gtkList beMultipleSelectionMode ]
		ifFalse: [ gtkList beSingleSelectionMode ].

	gtkList headersVisible: false.
	self setModelTo: gtkList.
	gtkList selection unselectAll.

	self presenter selection isEmpty 
		ifFalse: [ 
			self presenter selection selectedIndexes 
				do: [ :anIndex | gtkList selection selectPath: { anIndex } ]  ].
	
	self presenter selection whenChangedDo: [ 
		self presenter selection selectedIndexes 
			do: [ :anIndex | gtkList selection selectPath: { anIndex } ] ].
	
	gtkList connectRowActivated: [ :path | 
		self model doActivateAtIndex: path toArray first ].
	
	gtkList connectSelectionChanged: [ 
		self presenter selection selectIndexes: gtkList allSelected flattened ].
	
	self refreshWidgetHeaderTitleTo: gtkList
]

{ #category : #testing }
GtkListAdapter >> isShowColumnHeaders [
	
	^ self innerWidget isHeadersVisible
]

{ #category : #private }
GtkListAdapter >> modelItemsAsDisplay [
	
	^ self presenter model items 
		collect: [ :each | (self presenter display value: each) asString ]
]

{ #category : #private }
GtkListAdapter >> newTreeStore [

	self presenter hasIcons 
		ifFalse: [ ^ GtkTreeStore newStrings: self modelItemsAsDisplay ].
		
	^ self newTreeStoreWithIcons
]

{ #category : #private }
GtkListAdapter >> newTreeStoreWithIcons [
	| store pixbufCache |

	"a cache to not create extra pixbufs if they are not needed"	
	pixbufCache := IdentityDictionary new.
	store := GtkTreeStore newColumnTypes: { GType GDK_TYPE_PIXBUF.  GType G_TYPE_STRING }.
	self presenter items do: [ :each | 
		| icon |
		
		icon := self presenter iconFor: each.
		store appendNew
			at: 0 putObject: (pixbufCache 
				at: icon 
				ifAbsentPut: [ GdkPixbuf newForm: icon ]);
			at: 1 putString: (self presenter displayValueOf: each) ].

	^ store
]

{ #category : #events }
GtkListAdapter >> refreshWidgetHeaderTitle [
	
	self innerWidgetDo: [ :w |
		self refreshWidgetHeaderTitleTo: w ]
]

{ #category : #events }
GtkListAdapter >> refreshWidgetHeaderTitleTo: gtkTreeView [
	
	self model headerTitle ifNotNil: [
		(gtkTreeView columns at: 1) title: self model headerTitle ].
	gtkTreeView headersVisible: self model headerTitle isNotNil
]

{ #category : #building }
GtkListAdapter >> setModelTo: gtkList [
	| columnIndex |

	columnIndex := 0.
	gtkList removeAllColumns.
	self presenter hasIcons ifTrue: [ 
		gtkList appendPixbufColumn: columnIndex.
		columnIndex := columnIndex + 1 ].
	gtkList appendTextColumn: columnIndex.
	gtkList model: self newTreeStore
]
