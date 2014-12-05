helpers-building
make: aBlock 
	| builder |
	builder := MarsMenuBuilder new.
	aBlock value: builder.
	^ self new 
		addAll: builder items;
		yourself