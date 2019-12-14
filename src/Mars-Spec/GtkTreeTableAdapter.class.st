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
	#traits : 'GtkTDisconnectSelectionEvents + GtkTHaveWrappingScrollBars + GtkTSortableColumns',
	#classTraits : 'GtkTDisconnectSelectionEvents classTrait + GtkTHaveWrappingScrollBars classTrait + GtkTSortableColumns classTrait',
	#instVars : [
		'levelsAdded',
		'objectCache',
		'defaultColumn'
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

	self addSearchTo: gtkWidget.
	
	self recreateStore: gtkWidget generateColumns: true.
	self configureInitialState: gtkWidget.
	self connectToGtkSignals: gtkWidget.
	self connectToSpecEvents: gtkWidget.
	
]

{ #category : #private }
GtkTreeTableAdapter >> addRow: anObject index: index into: store [
	| gtkRow |
	
	gtkRow := self doAddRow: anObject index: index into: store.
	"I will add the first level children of this row"
	self addChildrenFor: anObject into: gtkRow.
			
	^ gtkRow
]

{ #category : #building }
GtkTreeTableAdapter >> addSearchTo: gtkWidget [
	self flag: #TODO. "This method is same as GtkBaseListAdapter>>addSearchTo:. It needs to be unified."

	self presenter isSearchEnabled ifFalse: [ ^ self ].
	
	gtkWidget enableSearch: true.
	gtkWidget hasCustomSearch ifTrue: [
		gtkWidget searchFunction: [ :key :column :iter |
			self presenter 
				performSearch: (self presenter itemAtPath: iter toPathArray) 
				matching: key ] ]
]

{ #category : #accessing }
GtkTreeTableAdapter >> columnCount [
	
	^ self innerWidget model numberOfColumns
]

{ #category : #'private accessing' }
GtkTreeTableAdapter >> columns [

	^ self presenter columns ifEmpty: [ { self defaultColumn } ]
]

{ #category : #building }
GtkTreeTableAdapter >> configureInitialState: gtkWidget [

	gtkWidget headersVisible: self presenter isShowingColumnHeaders.
	
	self presenter selection isMultipleSelection 
		ifTrue: [ gtkWidget beMultipleSelectionMode ]
		ifFalse: [ gtkWidget beSingleSelectionMode ].
	
	self presenter selection isEmpty
		ifFalse: [ self updateSelectionOf: gtkWidget ]	.
	
	self presenter contextMenu ifNotNil: [ :menu |
		self addMenu: menu to: gtkWidget ]
]

{ #category : #building }
GtkTreeTableAdapter >> connectToGtkSignals: gtkWidget [
	
	gtkWidget connectSelectionChanged: [ 
		self backendUpdatingDo: [ 
			self updatePresenterSelection ] ].
	gtkWidget connectRowActivated: [ :path | 
		self presenter doActivateAtPath: path toArray ].
	gtkWidget connectRowExpanded: [ :iter |
		"it will be an orfan iterator (store not setted since it comes from a callback)"
		iter store: self store.
		self addLevelTo: (self presenter itemAtPath: iter toPathArray) parent: iter ]
]

{ #category : #building }
GtkTreeTableAdapter >> connectToSpecEvents: gtkWidget [

	self presenter whenShowColumnHeadersChangedDo: [ 
		gtkWidget headersVisible: self presenter isShowingColumnHeaders ].

	self presenter whenMultiSelectionChangedDo: [ 
		self presenter selection isMultipleSelection 
			ifTrue: [ gtkWidget beMultipleSelectionMode ]
			ifFalse: [ gtkWidget beSingleSelectionMode ] ].

	self presenter whenSelectionChangedDo: [
		self backendDetectCyclesDo: [  
			self 
				disconnectSelectionEventsOf: gtkWidget 
				during: [ self updateSelectionOf: gtkWidget ] ] ].

	self presenter whenRootsChangedDo: [ 
		self 
			disconnectSelectionEventsOf: gtkWidget 
			during: [ self recreateStore: gtkWidget generateColumns: false ] ].

	self presenter whenColumnsChangedDo: [ 
		self 
			disconnectSelectionEventsOf: gtkWidget 
			during: [ self recreateStore: gtkWidget generateColumns: true ] ]
]

{ #category : #'private accessing' }
GtkTreeTableAdapter >> defaultColumn [
			
	^ defaultColumn ifNil: [ 
		defaultColumn := SpStringTableColumn evaluated: #asString ]
]

{ #category : #building }
GtkTreeTableAdapter >> doAddRow: anObject index: rowIndex into: store [
	| gtkRow filler |
	
	gtkRow := store appendNew.
	filler := GtkTableRowFiller new
		columns: self columns;
		gtkRow: gtkRow;
		row: anObject;
		rowIndex: rowIndex;
		yourself.

	GtkTableRowFillerCache 
		value: self objectCache
		during: [ 		
			self columns do: [ :eachColumn | 
				filler visit: eachColumn ] ].

	^ gtkRow
]

{ #category : #private }
GtkTreeTableAdapter >> doRecreateColumns: gtkTreeView [
	| columnBuilder |

	gtkTreeView removeAllColumns.

	columnBuilder := self newColumnBuilder.
	columnBuilder view: gtkTreeView. 

	self columns do: [ :each | columnBuilder visit: each ]
]

{ #category : #private }
GtkTreeTableAdapter >> doRecreateStore: gtkTreeView [

	gtkTreeView model: (self newStoreFrom: self items)
]

{ #category : #private }
GtkTreeTableAdapter >> fillStore: store with: aCollection [
	
	aCollection withIndexDo: [ :each :index | 
		self 
			addRow: each 
			index: index
			into: store ]
]

{ #category : #accessing }
GtkTreeTableAdapter >> firstSelectedPath [
	
	^ self innerWidgetDo: [ :w | w selection selectedPath ]
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

{ #category : #testing }
GtkTreeTableAdapter >> isNonEditableRow: aRow column: aColumn [ 
	"no rows are directly editable in a component list (they can be 
	 if defined like that in the inner presenters, but it is handled different)"
	^ true
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
GtkTreeTableAdapter >> newColumnBuilder [

	^ GtkTreeTableColumnBuilder new 
		model: self presenter;
		columns: self columns;
		yourself
]

{ #category : #'private factory' }
GtkTreeTableAdapter >> newStore [
	| typeCollector |

	typeCollector := GtkTableColumnTypeCollector new.
	self columns collect: [ :each | 
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
GtkTreeTableAdapter >> recreateStore: gtkTreeView	generateColumns: doesGenerateColumns [
	
	doesGenerateColumns 
		ifTrue: [ self doRecreateColumns: gtkTreeView ].
	self doRecreateStore: gtkTreeView.
	self addSortableColumnsTo: gtkTreeView
]

{ #category : #updating }
GtkTreeTableAdapter >> refreshList [

	self innerWidgetDo: [ :w | 
		w model: (self newStoreFrom: self presenter items) ]
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
GtkTreeTableAdapter >> selectPath: aPath [

	self innerWidgetDo: [ :w |
		aPath 
			ifNotEmpty: [ w selection selectPath: aPath ]
			ifEmpty: [ w selection unselectAll ] ]
]

{ #category : #accessing }
GtkTreeTableAdapter >> selectedItem [
	| selectedPath |
	
	selectedPath := self firstSelectedPath.
	selectedPath ifNil: [ ^ nil ].
	selectedPath ifEmpty: [ ^ nil ].

	^ self model itemAtPath: selectedPath
]

{ #category : #accessing }
GtkTreeTableAdapter >> selectedPaths [
	
	^ self innerWidgetDo: [ :w | w allSelected ]
]

{ #category : #private }
GtkTreeTableAdapter >> sortableItemAt: index [ 
	
	^ self presenter roots at: index
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

	self innerWidgetDo: [ :w |
		| needToCleanUP |
	
		needToCleanUP := self presenter selection isEmpty.
		self flag: #hack.
		"GTK has an issue when giving the focus to a List. When it gives 
		 the focus selects the first element"
		needToCleanUP 
			ifTrue: [ 
				self disconnectSelectionEventsOf: w during: [ 
					self doTakeKeyboardFocus.
					w selection unselectAll ] ]
			ifFalse: [ 
				self doTakeKeyboardFocus ] ]
]

{ #category : #building }
GtkTreeTableAdapter >> updatePresenterSelection [
	
	self innerWidgetDo: [ :w | 
		self rowSelected: w selected ]
]

{ #category : #building }
GtkTreeTableAdapter >> updateSelectionOf: gtkWidget [

	GtkRunLoop defer: [ 
		self presenter selection selectedPaths 
			do: [ :selectedPath | self selectItemIn: gtkWidget path: selectedPath ] ]
]

{ #category : #building }
GtkTreeTableAdapter >> widgetClass [
	
	^ GtkTreeView
]
