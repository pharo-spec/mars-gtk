Extension { #name : #GtkZombieSignal }

{ #category : #'*Mars-Gtk-Utils' }
GtkZombieSignal >> logIn: aLogger [

	^ aLogger logZombieSignal: self
]
