"
GtkAccelLabel — A label which displays an accelerator key on the right of the text

https://developer.gnome.org/gtk3/stable/GtkAccelLabel.html
"
Class {
	#name : #GtkAccelLabel,
	#superclass : #GtkLabel,
	#category : #'Mars-Gtk-Widget-Display'
}

{ #category : #private }
GtkAccelLabel class >> accelLabelNew: string [

	^ self ffiCall: #(GtkAccelLabel* gtk_accel_label_new (String string))
]

{ #category : #'instance creation' }
GtkAccelLabel class >> new [

	self error: 'Use #newLabel:'
]

{ #category : #'instance creation' }
GtkAccelLabel class >> newLabel: aString [

	^ (self accelLabelNew: aString) initialize
]

{ #category : #private }
GtkAccelLabel >> accelLabelSetAccelKey: accelerator_key modifiers: accelerator_mods [
	
	self ffiCall: #(void gtk_accel_label_set_accel (
		self,
		guint accelerator_key,
		GdkModifierType accelerator_mods))
]

{ #category : #accessing }
GtkAccelLabel >> accelerator: aShortcut [
	| charValue modifiers |

	charValue := aShortcut character key asciiValue.
	modifiers := aShortcut modifier asGdkModifierType.
	
	self accelLabelSetAccelKey: charValue  modifiers: modifiers
]

{ #category : #accessing }
GtkAccelLabel >> widget: accel_widget [

	self ffiCall: #(void gtk_accel_label_set_accel_widget (self, GtkWidget *accel_widget))
]
