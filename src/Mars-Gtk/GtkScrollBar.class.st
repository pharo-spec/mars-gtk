"
GtkScrollbar
GtkScrollbar — A Scrollbar

https://developer.gnome.org/gtk3/stable/GtkScrollbar.html
"
Class {
	#name : #GtkScrollBar,
	#superclass : #GtkWidget,
	#instVars : [
		'adjustment'
	],
	#pools : [
		'GtkOrientation'
	],
	#category : #'Mars-Gtk-Widget-ScrollBar'
}

{ #category : #'instance creation - private' }
GtkScrollBar class >> basicOrientation: orientation adjustment: adjustment [

	^ self ffiCall: #(GtkScrollBar *gtk_scrollbar_new  (GtkOrientation orientation, GtkAdjustment *adjustment))
]

{ #category : #examples }
GtkScrollBar class >> example [ 

	<script>
	
	| adjustment sb box win lastAdjustmentValueHolder |
	
	GtkApplication ensureRunning.
	
	"We use a value holder here to keep reference to the adjustment object from the window.
	It is required only for this simple example but you need to protect the adjustment
	object from being grabage-collected too."
	lastAdjustmentValueHolder := NewValueHolder new.
	
	adjustment := GtkAdjustment newDefault.
	adjustment pinInMemory.
	adjustment configureValue: 100 lower: 0 upper: 400 stepIncrement: 10 pageIncrement: 50 pageSize: 50.

	sb := GtkScrollBar newVerticalAdjustment: adjustment.
	
	(GtkAdjustmentValueChangedCallback do: [ :anAdjustment | 
		anAdjustment pinInMemory.
		lastAdjustmentValueHolder value: anAdjustment.
		anAdjustment value traceCr ]) connectTo: adjustment.

	box := GtkBox newVertical 
			packStart: (sb);
			yourself.
			
	win := GtkWindow new 
			autoRelease;
			title: 'Layout';
			defaultSize: 500@200;
			add: box;
			center;
			data: lastAdjustmentValueHolder;
			showAll.
			
]

{ #category : #accessing }
GtkScrollBar class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_scrollbar_get_type())
]

{ #category : #'instance creation' }
GtkScrollBar class >> newHorizontalAdjustment: adjustment [

	^ self orientation: GtkOrientation GTK_ORIENTATION_HORIZONTAL adjustment: adjustment
]

{ #category : #'instance creation' }
GtkScrollBar class >> newVerticalAdjustment: adjustment [

	^ self orientation: GtkOrientation GTK_ORIENTATION_VERTICAL adjustment: adjustment
]

{ #category : #'instance creation - private' }
GtkScrollBar class >> orientation: orientation adjustment: adjustment [

	| widget |
	
	adjustment pinInMemory.
	widget := (self basicOrientation: orientation adjustment: adjustment).
	^ widget
		adjustment: adjustment;
		initialize;
		yourself.
]

{ #category : #accessing }
GtkScrollBar >> adjustment [
	^ adjustment
]

{ #category : #accessing }
GtkScrollBar >> adjustment: anObject [
	adjustment := anObject
]
