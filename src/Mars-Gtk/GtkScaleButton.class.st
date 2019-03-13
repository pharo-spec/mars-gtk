"
GtkScaleButton
GtkScaleButton — A button which pops up a scale

https://developer.gnome.org/gtk3/unstable/GtkScaleButton.html
"
Class {
	#name : #GtkScaleButton,
	#superclass : #GtkButton,
	#category : #'Mars-Gtk-Widget-Buttons'
}

{ #category : #private }
GtkScaleButton class >> basicNewWithIconSize: size min: min max: max step: step icons: icons [

	^ self ffiCall: #(GtkScaleButton *gtk_scale_button_new (GtkIconSize size,
                      gdouble min,
                      gdouble max,
                      gdouble step,
                      const gchar **icons))
]

{ #category : #private }
GtkScaleButton class >> buttonNew [

	self shouldNotImplement
]

{ #category : #private }
GtkScaleButton class >> buttonNewWithLabel: utf8EncodedString [

	self shouldNotImplement
]

{ #category : #'instance creation' }
GtkScaleButton class >> newWithIconSize: size min: min max: max step: step icons: icons [

	^ (self 
		basicNewWithIconSize: size 
		min: min asFloat 
		max: max asFloat 
		step: step asFloat 
		icons: icons)
		initialize
]

{ #category : #events }
GtkScaleButton >> connectPopdown: aBlock [

	self connect: 'popdown' do: aBlock
]

{ #category : #events }
GtkScaleButton >> connectPopup: aBlock [

	self connect: 'popup' do: aBlock
]

{ #category : #events }
GtkScaleButton >> connectValueChanged: aBlock [

	^ self 
		connect: 'value-changed'
		signature: #(gboolean (void *widget, gdouble value, void *aData))  
 		do: [ :widget :value :aData | aBlock cull: value ] 
]

{ #category : #accessing }
GtkScaleButton >> value [

	^ self ffiCall: #(gdouble gtk_scale_button_get_value (self))
]

{ #category : #accessing }
GtkScaleButton >> value: aValue [

	self ffiCall: #(void gtk_scale_button_set_value (self, gdouble value))
]
