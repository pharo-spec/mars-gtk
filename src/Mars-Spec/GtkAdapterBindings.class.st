Class {
	#name : #GtkAdapterBindings,
	#superclass : #SpecAdapterBindings,
	#category : #'Mars-Spec'
}

{ #category : #initialize }
GtkAdapterBindings >> initializeBindings [
	
	^ bindings
		at: #ButtonAdapter				put: #GtkButtonAdapter;
		at: #CheckBoxAdapter			put: nil;
		at: #ContainerAdapter			put: #GtkContainerAdapter;
		at: #DiffAdapter				put: nil;
		at: #DropListAdapter			put: nil;
		at: #LabelAdapter				put: #GtkLabelAdapter;
		at: #ListAdapter				put: #GtkListAdapter;
		at: #IconListAdapter			put: #MorphicIconListAdapter;
		at: #FastTableAdapter			put: nil;
		at: #ImageAdapter				put: #GtkImageAdapter;
		at: #MultiColumnListAdapter	put: nil;
		at: #MenuAdapter				put: #GtkMenuAdapter;
		at: #MenuGroupAdapter			put: #GtkMenuGroupAdapter;
		at: #MenuItemAdapter			put: #GtkMenuItemAdapter;
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
		yourself
]
