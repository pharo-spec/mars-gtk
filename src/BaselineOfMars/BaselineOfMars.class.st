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
		do: [ 
			self beacon: spec.
			
			spec
				"core"
				package: 'Mars-Pango';
				package: 'Mars-Gtk' with: [ spec requires: #('Beacon' 'Mars-Pango') ];
				package: 'Mars-Gtk-Morphic' with: [ spec requires: #('Mars-Gtk') ];
				"spec"
				package: 'Mars-Spec-Text' with: [ spec requires: 'Mars-Gtk' ];
				package: 'Mars-Spec-Keybindings' with: [ spec requires: 'Mars-Gtk' ];
				package: 'Mars-Spec' with: [ spec requires: #('Mars-Gtk' 'Mars-Spec-Text' 'Mars-Spec-Keybindings') ];
				"testing"
				package: 'Mars-GtkBackendTests' with: [ spec requires: 'Mars-Spec' ] ]
]

{ #category : #'external projects' }
BaselineOfMars >> beacon: spec [

	spec baseline: 'Beacon' with: [ 
		spec repository: 'github://pharo-project/pharo-beacon/repository' ]
]
