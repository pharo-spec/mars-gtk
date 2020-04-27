"
A binding set maintains a list of activatable key bindings. A single binding set can match multiple types of widgets. Similar to style contexts, can be matched by any information contained in a widgets GtkWidgetPath. When a binding within a set is matched upon activation, an action signal is emitted on the target widget to carry out the actual activation.

https://developer.gnome.org/gtk3/unstable/gtk3-Bindings.html#GtkBindingSet
"
Class {
	#name : #GtkBindingSet,
	#superclass : #GBaseObject,
	#category : #'Mars-Gtk-Misc'
}

{ #category : #adding }
GtkBindingSet >> addSignal: keyval modifiers: modifiers signal: signal_name [

	self ffiCall: #(void gtk_binding_entry_add_signal (
		self,
		guint keyval,
		GdkModifierType modifiers,
		const gchar *signal_name,
		guint "n_args" 0))
]
