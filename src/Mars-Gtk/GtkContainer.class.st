"
GtkContainer — Base class for widgets which contain other widgets

https://developer.gnome.org/gtk3/stable/GtkContainer.html
"
Class {
	#name : #GtkContainer,
	#superclass : #GtkWidget,
	#instVars : [
		'children'
	],
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #accessing }
GtkContainer >> add: widget [

	self keepWidget: widget.
	self basicAdd: widget.

	^ widget
]

{ #category : #accessing }
GtkContainer >> addAll: aCollection [

	aCollection do: [ :each | self add: each ]
]

{ #category : #private }
GtkContainer >> basicAdd: widget [

	self ffiCall: #(void gtk_container_add (self, GtkWidget *widget))

]

{ #category : #private }
GtkContainer >> basicForEach: callback [

	^ self ffiCall: #(void gtk_container_foreach (self, GCallback callback, NULL))

	
]

{ #category : #private }
GtkContainer >> basicRemove: widget [
	self ffiCall: #(void gtk_container_remove (self, GtkWidget *widget))	
]

{ #category : #accessing }
GtkContainer >> borderWidth [
	^ self ffiCall: #(guint gtk_container_get_border_width (self))
]

{ #category : #accessing }
GtkContainer >> borderWidth: border_width [
	self ffiCall: #(void gtk_container_set_border_width (self, guint border_width))
]

{ #category : #accessing }
GtkContainer >> children [ 
	^ children
]

{ #category : #private }
GtkContainer >> findChildByHandle: anExternalAddress [
	| address |
	(anExternalAddress isNil or: [ anExternalAddress isNull ]) ifTrue: [ ^ nil ].
	address := anExternalAddress asInteger.
	^ children detect: [ :each | each getHandle asInteger = address ]
]

{ #category : #private }
GtkContainer >> forEach: aBlock [ 
	
	self basicForEach: (GCallback 
		signature: #(void (void *widget, gpointer callback_data)) 
		block: [ :widget :callback_data | aBlock value: widget ])
]

{ #category : #'GT-Inspector-Extension' }
GtkContainer >> gtInspectorWidgetsIn: composite [
	<gtInspectorPresentationOrder: 80>  

	composite tree 
		title: 'Widgets';
		rootsExpanded;
		display: [:each | {each} ];
		children: [:each | 
			(each isKindOf: GtkContainer) 
				ifTrue: [ each children ]
				ifFalse: [ nil ]];
		when: [:each | each hasChildren ]
]

{ #category : #testing }
GtkContainer >> hasChildren [
	^ self children notEmpty
]

{ #category : #initialization }
GtkContainer >> initialize [

	super initialize.
	children := #()
]

{ #category : #private }
GtkContainer >> keepWidget: widget [

	children := children copyWith: widget


]

{ #category : #accessing }
GtkContainer >> remove: widget [
	"remove widgets will also destroy them (since it will not be referenced, unless you 
	 took a reference explicitly, which we are not doing now). 
	 See https://developer.gnome.org/gtk3/stable/GtkContainer.html#gtk-container-remove"
	self basicRemove: widget.
	children := children copyWithout: widget
]

{ #category : #accessing }
GtkContainer >> removeAll [
	"remove widgets will also destroy them (since it will not be referenced, unless you 
	 took a reference explicitly, which we are not doing now). 
	 See https://developer.gnome.org/gtk3/stable/GtkContainer.html#gtk-container-remove"
	children do: [ :each | self basicRemove: each ].
	children := #()
]

{ #category : #'private deferring' }
GtkContainer >> withAllChildrenDo: aBlock [

	aBlock cull: self.
	self children do: [ :each |
		each withAllChildrenDo: aBlock ]
]
