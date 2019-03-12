Class {
	#name : #BaselineOfMars,
	#superclass : #BaselineOf,
	#category : 'BaselineOfMars'
}

{ #category : #baseline }
BaselineOfMars >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self beacon: spec.
			spec package: 'Mars-Gtk' with: [ spec requires: 'Beacon' ].
			spec package: 'Mars-Spec' with: [ spec requires: 'Mars-Gtk' ].
			spec
				package: 'Mars-GtkBackendTests'
				with: [ spec requires: 'Mars-Spec' ] ]
]

{ #category : #'external projects' }
BaselineOfMars >> beacon: spec [

	spec baseline: 'Beacon' with: [ 
		spec repository: 'github://pharo-project/pharo-beacon/repository' ]
]
