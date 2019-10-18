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

{ #category : #'instance creation' }
GtkScrollBar class >> basicOrientation: orientation adjustment: adjustment [

	^ self ffiCall: #(GtkScrollBar *gtk_scrollbar_new  (GtkOrientation orientation, GtkAdjustment *adjustment))
]

{ #category : #'instance creation' }
GtkScrollBar class >> example [ 

	<script>
	
	| o adjustment sb box win lastAdjustmentValueHolder |
	
	GtkApplication ensureRunning.
	
	lastAdjustmentValueHolder := NewValueHolder new.
	
	o := GtkOrientation GTK_ORIENTATION_VERTICAL.
	adjustment := GtkAdjustment newDefault.
	adjustment pinInMemory.
	adjustment configureValue: 100 lower: 0 upper: 400 stepIncrement: 10 pageIncrement: 50 pageSize: 50.

	sb := GtkScrollBar orientation: o adjustment: adjustment.
	
	(GtkScrollBarValueChangedCallback do: [ :anAdjustment | 
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

{ #category : #'instance creation' }
GtkScrollBar class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_scrollbar_get_type())
]

{ #category : #'instance creation' }
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
