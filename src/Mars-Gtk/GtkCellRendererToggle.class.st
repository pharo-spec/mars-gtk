Class {
	#name : #GtkCellRendererToggle,
	#superclass : #GtkCellRenderer,
	#category : #'Mars-Gtk-Widget-CellRenderers'
}

{ #category : #private }
GtkCellRendererToggle class >> cellRendererNew [

	^ self ffiCall: #(GtkCellRendererToggle *gtk_cell_renderer_toggle_new (void))
]

{ #category : #accessing }
GtkCellRendererToggle class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_cell_renderer_toggle_get_type())
]

{ #category : #accessing }
GtkCellRendererToggle >> activatable: setting [

	self ffiCall: #(void gtk_cell_renderer_toggle_set_activatable (self, gboolean setting))
]

{ #category : #accessing }
GtkCellRendererToggle >> active: setting [

	self ffiCall: #(void gtk_cell_renderer_toggle_set_active (self, gboolean setting))
]

{ #category : #signaling }
GtkCellRendererToggle >> connectToggled: aBlock [

	(GCellRendererToggledCallback do: aBlock) connectTo: self
]

{ #category : #testing }
GtkCellRendererToggle >> isActivatable [

	^ self ffiCall: #(gboolean gtk_cell_renderer_toggle_get_activatable (self))
]

{ #category : #testing }
GtkCellRendererToggle >> isActive [

	self ffiCall: #(gboolean gtk_cell_renderer_toggle_get_active (self))
]
