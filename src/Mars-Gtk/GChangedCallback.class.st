"
The “changed” signal

void
user_function (GtkEditable *editable,
               gpointer     user_data)
T
he ::changed signal is emitted at the end of a single user-visible operation on the contents of the GtkEditable.
E.g., a paste operation that replaces the contents of the selection will cause only one signal emission (even though it is implemented by first deleting the selection, then inserting the new content, and may cause multiple ::notify::text signals to be emitted).
"
Class {
	#name : #GChangedCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #accessing }
GChangedCallback >> signalName [

	^ 'changed'
]
