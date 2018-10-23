Class {
	#name : #GtkAdapterBindings,
	#superclass : #SpecAdapterBindings,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #initialize }
GtkAdapterBindings >> initializeBindings [
	
	^ bindings
		at: #ButtonAdapter				put: #GtkButtonAdapter;
		at: #CheckBoxAdapter			put: nil;
		at: #ContainerAdapter			put: #GtkContainerAdapter;
		at: #GridAdapter				put: #GtkGridAdapter;
		at: #DiffAdapter				put: nil;
		at: #DropListAdapter			put: nil;
		at: #LabelAdapter				put: #GtkLabelAdapter;
		at: #ListAdapter				put: #GtkListAdapter;
		at: #IconListAdapter			put: #MorphicIconListAdapter;
		at: #FastTableAdapter			put: nil;
		at: #ImageAdapter				put: #GtkImageAdapter;
		at: #MultiColumnListAdapter	put: nil;
		at: #RadioButtonAdapter		put: nil;
		at: #SliderAdapter				put: nil;
		at: #TabManagerAdapter		put: #GtkTabManagerAdapter;
		at: #TabAdapter					put: #GtkTabAdapter;
		at: #TextAdapter				put: #GtkTextAdapter;
		at: #TextInputFieldAdapter	put: #GtkTextInputFieldAdapter;
		at: #TransferAdapter			put: nil;
		at: #TreeAdapter				put: nil;
		at: #TreeColumnAdapter		put: nil;
		at: #TreeNodeAdapter			put: nil;
		at: #WindowAdapter				put: #GtkWindowAdapter;
		at: #TickingWindowAdapter	put: nil;
		at: #DialogWindowAdapter		put: nil;
		"menu"
		at: #MenuBarAdapter			put: #GtkMenuBarAdapter;
		at: #MenuAdapter				put: #GtkMenuAdapter;
		at: #MenuGroupAdapter			put: nil; "not used"
		at: #MenuItemAdapter			put: #GtkMenuItemAdapter;
		"toolBar"
		at: #ToolBarAdapter			put: #GtkToolBarAdapter;
		at: #ToolBarButtonAdapter	put: #GtkToolBarButtonAdapter;
		yourself
]
