"
GtkLevelBar
GtkLevelBar — A bar that can used as a level indicator

https://developer.gnome.org/gtk3/stable/GtkLevelBar.html
"
Class {
	#name : #GtkLevelBar,
	#superclass : #GtkWidget,
	#category : #'Mars-Gtk-Widget-Display'
}

{ #category : #private }
GtkLevelBar class >> gtkLevelBarNew [

	^ self ffiCall: #(GtkLevelBar *gtk_level_bar_new (void))
]

{ #category : #private }
GtkLevelBar class >> gtkLevelBarNewWithMin: min_value withMax: max_value [

	^ self ffiCall: #(GtkLevelBar *gtk_level_bar_new_for_interval (gdouble min_value, gdouble max_value);)
]

{ #category : #'instance creation' }
GtkLevelBar class >> new [

	^ self gtkLevelBarNew initialize
]

{ #category : #'instance creation' }
GtkLevelBar class >> withMin: min_value withMax: max_value [

	^ (self gtkLevelBarNewWithMin: min_value withMax: max_value) initialize
]

{ #category : #private }
GtkLevelBar >> beInverted [

	^ self inverted: true
]

{ #category : #private }
GtkLevelBar >> beNormal [

	^ self inverted: false
]

{ #category : #private }
GtkLevelBar >> inverted [

	^ self ffiCall: #(gboolean gtk_level_bar_get_inverted (self))
]

{ #category : #private }
GtkLevelBar >> inverted: inverted [

	^ self ffiCall: #(void gtk_level_bar_set_inverted (self, gboolean inverted))
]

{ #category : #private }
GtkLevelBar >> maxValue [

	^ self ffiCall: #(gdouble gtk_level_bar_get_max_value (self))
]

{ #category : #private }
GtkLevelBar >> maxValue: value [

	^ self ffiCall: #(void gtk_level_bar_set_max_value (self, gdouble value))
]

{ #category : #private }
GtkLevelBar >> minValue [

	^ self ffiCall: #(gdouble gtk_level_bar_get_min_value (self))
]

{ #category : #private }
GtkLevelBar >> minValue: value [

	^ self ffiCall: #(void gtk_level_bar_set_min_value (self, gdouble value))
]

{ #category : #private }
GtkLevelBar >> mode [

	^ self ffiCall: #(GtkLevelBarMode gtk_level_bar_get_mode (self))
]

{ #category : #private }
GtkLevelBar >> mode: aMode [

	self ffiCall: #(void gtk_level_bar_set_mode (self, GtkLevelBarMode aMode))
]

{ #category : #private }
GtkLevelBar >> value [

	^ self ffiCall: #(gdouble gtk_level_bar_get_value (self))
]

{ #category : #private }
GtkLevelBar >> value: value [

	self ffiCall: #(void gtk_level_bar_set_value (self, gdouble value))
]
