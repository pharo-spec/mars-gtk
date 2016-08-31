instance creation
newMorph: anImageMorph
	^ self imageNewFromSurface: (self surfaceFor: anImageMorph)