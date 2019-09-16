"
GtkComboBox — A widget used to choose from a list of items

https://developer.gnome.org/gtk3/stable/GtkComboBox.html
"
Class {
	#name : #GtkComboBox,
	#superclass : #GtkBin,
	#traits : 'TGtkCellLayout',
	#classTraits : 'TGtkCellLayout classTrait',
	#instVars : [
		'model',
		'columns'
	],
	#category : #'Mars-Gtk-Widget-Input'
}

{ #category : #private }
GtkComboBox class >> comboBoxNew [

	^ self ffiCall: #(GtkComboBox *gtk_combo_box_new (void))
]

{ #category : #private }
GtkComboBox class >> comboBoxNewWithEntry [

	^ self ffiCall: #(GtkComboBox *GtkWidget *gtk_combo_box_new_with_entry (void))
]

{ #category : #accessing }
GtkComboBox class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_combo_box_get_type())
]

{ #category : #'instance creation' }
GtkComboBox class >> new [

	^ self comboBoxNew initialize
]

{ #category : #'instance creation' }
GtkComboBox class >> newModel: aTreeModel [

	^ self new model: aTreeModel
]

{ #category : #'instance creation' }
GtkComboBox class >> newWithEntry [

	^ self comboBoxNewWithEntry initialize
]

{ #category : #accessing }
GtkComboBox >> activeId [

	^ self basicActiveId
]

{ #category : #accessing }
GtkComboBox >> activeId: anIdString [

	^ self basicActiveId: anIdString
]

{ #category : #accessing }
GtkComboBox >> activeIndex [

	^ self ffiCall: #(gint gtk_combo_box_get_active (self))
]

{ #category : #accessing }
GtkComboBox >> activeIndex: index [

	^ self ffiCall: #(void gtk_combo_box_set_active (self, gint index))
]

{ #category : #'convenience columns' }
GtkComboBox >> appendPixbufColumn: columnIndex [
	| renderer |

	renderer := GtkCellRendererPixbuf new.
	self	
		packStart: renderer expand: false;
		addAttribute: 'pixbuf' 
			column: columnIndex 
			renderer: renderer
]

{ #category : #'convenience columns' }
GtkComboBox >> appendTextColumn: columnIndex [
	| renderer |

	renderer := GtkCellRendererText new.
	self 
		packStart: renderer;
		addAttribute: 'text' 
			column: columnIndex 
			renderer: renderer
]

{ #category : #private }
GtkComboBox >> basicActiveId [

	^ self ffiCall: #(String gtk_combo_box_get_active_id (self))
]

{ #category : #private }
GtkComboBox >> basicActiveId: utf8EncodedId [

	^ self ffiCall: #(gboolean gtk_combo_box_set_active_id (self, String utf8EncodedId))
]

{ #category : #TOREFACTOR }
GtkComboBox >> beText [
	"I'm assuming there is just one column. 
	 And that it will be a text column. 
	 I'm asuming a lot of things :P"
	| cell |
	
	cell := GtkCellRendererText new.
	self packStart: cell expand: true.
	self addAttribute: 'text' column: 0 renderer: cell
]

{ #category : #accessing }
GtkComboBox >> columnId [

	^ self ffiCall: #(gint gtk_combo_box_get_id_column (self))
]

{ #category : #accessing }
GtkComboBox >> columnId: columnId [

	^ self ffiCall: #(void gtk_combo_box_set_id_column (self, gint columnId))
]

{ #category : #accessing }
GtkComboBox >> columnSpanColumn [

	^ self ffiCall: #(gint gtk_combo_box_get_column_span_column (self))
]

{ #category : #accessing }
GtkComboBox >> columnSpanColumn: columnSpan [

	^ self ffiCall: #(void gtk_combo_box_set_column_span_column (self, gint columnSpan))
]

{ #category : #signals }
GtkComboBox >> connectChanged: aBlock [

	(GChangedCallback do: aBlock) connectTo: self
]

{ #category : #accessing }
GtkComboBox >> entryTextColumn [

	^ self ffiCall: #(gint gtk_combo_box_get_entry_text_column (self))
]

{ #category : #accessing }
GtkComboBox >> entryTextColumn: columnId [

	self ffiCall: #(void gtk_combo_box_set_entry_text_column (self, gint columnId))
]

{ #category : #accessing }
GtkComboBox >> fixedWidth [

	^ self ffiCall: #(gboolean gtk_combo_box_get_popup_fixed_width (self))
]

{ #category : #accessing }
GtkComboBox >> fixedWidth: aBoolean [

	^ self ffiCall: #(void gtk_combo_box_set_popup_fixed_width (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkComboBox >> hasEntry [

	^ self ffiCall: #(gboolean gtk_combo_box_get_has_entry (self))
]

{ #category : #accessing }
GtkComboBox >> model [
	^ model
]

{ #category : #accessing }
GtkComboBox >> model: aTreeModel [

	model := aTreeModel.
	self setModel: aTreeModel
]

{ #category : #accessing }
GtkComboBox >> rowSpanColumn [

	^ self ffiCall: #(gint gtk_combo_box_get_row_span_column (self))
]

{ #category : #accessing }
GtkComboBox >> rowSpanColumn: rowSpan [

	^ self ffiCall: #(void gtk_combo_box_set_row_span_column (self, gint rowSpan))
]

{ #category : #accessing }
GtkComboBox >> selectIndex: anInteger [ 
	
	self activeIndex: anInteger - 1
]

{ #category : #accessing }
GtkComboBox >> selectedIndexes [

	| selectedValue |
	selectedValue := self activeIndex.
	^ selectedValue = -1
		ifTrue: [ #() ]
		ifFalse: [ {(selectedValue + 1)} ]
]

{ #category : #private }
GtkComboBox >> setModel: aTreeModel [

	^ self ffiCall: #(void gtk_combo_box_set_model (self, GObject *aTreeModel))
]

{ #category : #accessing }
GtkComboBox >> wrapWidth [

	^ self ffiCall: #(gint gtk_combo_box_get_wrap_width (self))
]

{ #category : #accessing }
GtkComboBox >> wrapWidth: width [

	self ffiCall: #(void gtk_combo_box_set_wrap_width (self, gint width))
]
