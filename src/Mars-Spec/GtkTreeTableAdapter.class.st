"
I'm an adapter to render a TreeTablePresenter with Gtk3.

Since Gtk3 uses a GtkTreeStore to render the tree, and it needs to exists previously (but you can edit it with iterators), I use a trick to not pre-render all elements at once (a task that can be very time/space consuming depending on the tree to present): I use an event of the tree (test-row-expanded) to add a new level to the children of the item I'm expanding. 
Confused? Let's see an example: Let's suppose I have this tree: 

A
	B1
		C1
		C2
	B2
	

In first iteration, I will add just this levels to the store: 

A
	B1
	B2
	
Which will ensure ""A"" will show the expand arrow (since it has children). Now, when I expand ""A"", I need to dig into its children and add childs (to ensure B1 will show an expansion row).
After processing, we will the full tree.  
"
Class {
	#name : #GtkTreeTableAdapter,
	#superclass : #GtkAdapter,
	#traits : 'TGtkDisconnectSelectionEvents + TGtkHaveWrappingScrollBars',
	#classTraits : 'TGtkDisconnectSelectionEvents classTrait + TGtkHaveWrappingScrollBars classTrait',
	#instVars : [
		'levelsAdded',
		'objectCache'
	],
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #private }
GtkTreeTableAdapter >> addChildrenFor: anObject into: gtkRow [

	(self model childrenFor: anObject) withIndexDo: [ :childElement :index |
		self 
			doAddRow: childElement 
			index: index 
			into: gtkRow ]
]

{ #category : #private }
GtkTreeTableAdapter >> addLevelTo: item parent: iter [

	(self isLevelAddedFor: item) ifTrue: [ ^ self ].
	"no children, no need to do anything"
	iter hasChildren ifFalse: [ ^ self ].	
	iter childrenDo: [ :each | 
		self 
			addChildrenFor: (self model itemAtPath: each toPathArray) 
			into: each ].
	self markLevelAddedFor: item
]

{ #category : #building }
GtkTreeTableAdapter >> addLevelsUpTo: aPath to: gtkWidget [	
	| segments |	
		
	segments := OrderedCollection new.
	aPath do: [ :each | 
		| iter |
		segments add: each.
		iter := gtkWidget model iteratorFromPath: (GtkTreePath newFromArray: segments).
		self addLevelTo: (self model itemAtPath: segments) parent: iter ]
]

{ #category : #building }
GtkTreeTableAdapter >> addModelTo: gtkWidget [
	
	super addModelTo: gtkWidget.

	self recreateStore: gtkWidget generateColumns: true.	
	gtkWidget headersVisible: self model isShowingColumnHeaders.

	self presenter selection isMultipleSelection 
		ifTrue: [ gtkWidget beMultipleSelectionMode ]
		ifFalse: [ gtkWidget beSingleSelectionMode ].

	self model selection isEmpty 
		ifFalse: [ self updateSelectionOf: gtkWidget ].
	
	gtkWidget connectSelectionChanged: [ self updatePresenterSelection ].
	gtkWidget connectRowActivated: [ :path | 
		self model doActivateAtPath: path toArray ].
	
	gtkWidget connectRowExpanded: [ :iter |
		"it will be an orfan iterator (store not setted since it comes from a callback)"
		iter store: self store.
		self addLevelTo: (self model itemAtPath: iter toPathArray) parent: iter ].
	
	self model whenShowColumnHeadersChangedDo: [ 
		gtkWidget headersVisible: self model isShowingColumnHeaders ].

	self model whenMultiSelectionChangedDo: [ 
		self presenter selection isMultipleSelection 
			ifTrue: [ gtkWidget beMultipleSelectionMode ]
			ifFalse: [ gtkWidget beSingleSelectionMode ] ].

	self model whenSelectionChangedDo: [
		self 
			disconnectSelectionEventsOf: gtkWidget 
			during: [ self updateSelectionOf: gtkWidget ] ].
	self model whenRootsChangedDo: [ 
		self 
			disconnectSelectionEventsOf: gtkWidget 
			during: [ self recreateStore: gtkWidget generateColumns: false ] ].
	self model whenColumnsChangedDo: [ 
		self 
			disconnectSelectionEventsOf: gtkWidget 
			during: [ self recreateStore: gtkWidget generateColumns: true ] ].

]

{ #category : #private }
GtkTreeTableAdapter >> addRow: anObject index: index into: store [
	| gtkRow |
	
	gtkRow := self doAddRow: anObject index: index into: store.
	"I will add the first level children of this row"
	self addChildrenFor: anObject into: gtkRow.
			
	^ gtkRow
]

{ #category : #accessing }
GtkTreeTableAdapter >> columnCount [
	
	^ self innerWidget model numberOfColumns
]

{ #category : #building }
GtkTreeTableAdapter >> doAddRow: anObject index: rowIndex into: store [
	| gtkRow filler |
	
	gtkRow := store appendNew.
	filler := GtkTableRowFiller new
		columns: self model columns;
		gtkRow: gtkRow;
		row: anObject;
		rowIndex: rowIndex;
		yourself.

	GtkTableRowFillerCache 
		value: self objectCache
		during: [ 		
			self model columns do: [ :eachColumn | 
				filler visit: eachColumn ] ].

	^ gtkRow
]

{ #category : #private }
GtkTreeTableAdapter >> fillStore: store with: aCollection [
	
	aCollection withIndexDo: [ :each :index | 
		self 
			addRow: each 
			index: index
			into: store ]
]

{ #category : #private }
GtkTreeTableAdapter >> initialize [

	super initialize.
	levelsAdded := Set new
]

{ #category : #private }
GtkTreeTableAdapter >> isLevelAddedFor: item [

	^ levelsAdded includes: item
]

{ #category : #private }
GtkTreeTableAdapter >> items [

	^ self model roots
]

{ #category : #private }
GtkTreeTableAdapter >> markLevelAddedFor: item [

	levelsAdded add: item
]

{ #category : #'private factory' }
GtkTreeTableAdapter >> newColumnBuilderOn: aTreeTablePresenter [

	^ GtkTreeTableColumnBuilder new 
		model: aTreeTablePresenter;
		columns: aTreeTablePresenter columns;
		yourself
]

{ #category : #'private factory' }
GtkTreeTableAdapter >> newStore [
	| typeCollector |

	typeCollector := GtkTableColumnTypeCollector new.
	self model columns collect: [ :each | 
		typeCollector visit: each ].
	^ self storeClass newColumnTypes: typeCollector types
]

{ #category : #'private factory' }
GtkTreeTableAdapter >> newStoreFrom: aCollection [
	| store |

	store := self newStore.
	self 
		fillStore: store
		with: aCollection.

	^ store
]

{ #category : #private }
GtkTreeTableAdapter >> objectCache [

	^ objectCache ifNil: [ objectCache := IdentityDictionary new ]
]

{ #category : #building }
GtkTreeTableAdapter >> recreateStore: gtkWidget	generateColumns: doesGenerateColumns [
	| store columnBuilder |
	
	store := self newStoreFrom: self items.
	gtkWidget model: store.

	doesGenerateColumns ifFalse: [ ^ self ].
	
	columnBuilder := self newColumnBuilderOn: self model.
	columnBuilder view: gtkWidget. 

	gtkWidget removeAllColumns.

	self model columns do: [ :each | 
		columnBuilder visit: each ].

]

{ #category : #updating }
GtkTreeTableAdapter >> refreshList [

	self innerWidget model: (self newStoreFrom: self model items)
]

{ #category : #private }
GtkTreeTableAdapter >> rowSelected: path [

	self model selection selectPath: path
]

{ #category : #building }
GtkTreeTableAdapter >> selectItemIn: gtkWidget path: aPath [

	(aPath isNil or: [ aPath isEmpty ]) ifTrue: [ 
		gtkWidget selection unselectAll. 
		^ self ].

	self addLevelsUpTo: aPath to: gtkWidget.
	gtkWidget expandToPath: aPath.
	gtkWidget selection selectPath: aPath.
	gtkWidget scrollToPath: aPath.

	(gtkWidget selection isSelected: aPath)
		ifFalse: [ gtkWidget selection unselectAll ].
]

{ #category : #accessing }
GtkTreeTableAdapter >> selectedItem [
	| selectedPath |
	
	selectedPath := self innerWidget selection selectedPath.

	selectedPath ifNil: [ ^ nil ].
	selectedPath ifEmpty: [ ^ nil ].

	^ self model itemAtPath: selectedPath
]

{ #category : #accessing }
GtkTreeTableAdapter >> selectedPaths [
	
	^ self innerWidget allSelected
]

{ #category : #private }
GtkTreeTableAdapter >> store [ 

	^ self innerWidgetDo: [ :w | w model ]
]

{ #category : #private }
GtkTreeTableAdapter >> storeClass [

	^ GtkTreeStore
]

{ #category : #private }
GtkTreeTableAdapter >> takeKeyboardFocus [
	| needToCleanUP |
	
	needToCleanUP := self presenter selection isEmpty.
	self flag: #hack.
	"GTK has an issue when giving the focus to a List. When it gives the focus selects the first element"
	needToCleanUP 
		ifTrue: [ 
			self disconnectSelectionEventsOf: self innerWidget during: [ 
				self doTakeKeyboardFocus.
				self innerWidget selection unselectAll ] ]
		ifFalse: [ 
			self doTakeKeyboardFocus ]
]

{ #category : #building }
GtkTreeTableAdapter >> updatePresenterSelection [
	
	self innerWidgetDo: [ :w | 
		self rowSelected: w selected ]
]

{ #category : #building }
GtkTreeTableAdapter >> updateSelectionOf: gtkWidget [

	self model selection selectedPaths do: [ :selectedPath | 
		self selectItemIn: gtkWidget path: selectedPath ]
]

{ #category : #building }
GtkTreeTableAdapter >> widgetClass [
	
	^ GtkTreeView
]
