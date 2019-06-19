Class {
	#name : #BaselineOfMars,
	#superclass : #BaselineOf,
	#category : #BaselineOfMars
}

{ #category : #baseline }
BaselineOfMars >> baseline: spec [
	<baseline>

	spec
		for: #common
		do: [ 
			self beacon: spec.
			
			spec postLoadDoIt: #installGtkDriver.

			spec
				"core"
				package: 'Mars-Pango';
				package: 'Mars-Gtk' with: [ spec requires: #('Beacon' 'Mars-Pango') ];
				package: 'Mars-Gtk-Morphic' with: [ spec requires: #('Mars-Gtk') ];
				"spec"
				package: 'Mars-Spec-Text' with: [ spec requires: 'Mars-Gtk' ];
				package: 'Mars-Spec-Keybindings' with: [ spec requires: 'Mars-Gtk' ];
				package: 'Mars-Spec' with: [ spec requires: #('Mars-Gtk' 'Mars-Spec-Text' 'Mars-Spec-Keybindings') ];
				package: 'Mars-Gtk-Morphic-Adapter' with: [ spec requires: #('Mars-Gtk-Morphic' 'Mars-Spec') ];
				"testing"
				package: 'Mars-GtkBackendTests' with: [ spec requires: 'Mars-Spec' ];
				package: 'Mars-Gtk-Tests' with: [ spec requires: 'Mars-Gtk' ];
				package: 'Mars-Gtk-Morphic-Tests' with: [ spec requires: 'Mars-Gtk-Morphic' ] ]
]

{ #category : #'external projects' }
BaselineOfMars >> beacon: spec [

	spec baseline: 'Beacon' with: [ 
		spec repository: 'github://pharo-project/pharo-beacon/repository' ]
]

{ #category : #baseline }
BaselineOfMars >> installGtkDriver [
			
	"If we installed OSGtkDriver, we want to use it as default"
	Smalltalk globals
		at: #OSGtkDriver
		ifPresent: [ :driverClass | OSWindowDriver driverClass: driverClass ]
]
