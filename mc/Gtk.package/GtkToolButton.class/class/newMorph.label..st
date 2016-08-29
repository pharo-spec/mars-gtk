instance creation
newMorph: anImageMorph label: aString
	^ self newIcon: (GtkImage newMorph: anImageMorph) label: aString