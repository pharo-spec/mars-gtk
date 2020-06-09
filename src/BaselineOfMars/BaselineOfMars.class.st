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
			self spec2: spec.
			self threadedffi: spec.
			self beacon: spec.
			self taskit: spec.
			
			spec postLoadDoIt: #postLoad.

			spec
				"core"
				package: 'Mars-Pango';
				package: 'Mars-Gtk' with: [ spec requires: #('ThreadedFFI' 'Beacon' 'Mars-Pango') ];
				package: 'Mars-Gtk-SourceView' with: [ spec requires: #('Mars-Gtk') ];
				package: 'Mars-Gtk-Morphic' with: [ spec requires: #('Mars-Gtk') ];
				package: 'Mars-Gtk-Morphic-UIManager' with: [ spec requires: #('Mars-Gtk-Morphic') ];
				"spec"
				package: 'Mars-Spec-Frame';
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
		spec 
			repository: 'github://pharo-project/pharo-beacon/repository';
			loads: #('Core' 'Beacon-SerializingLoggers' 'Beacon-File' 'Beacon-Zinc') ]
]

{ #category : #doits }
BaselineOfMars >> installGtkDriver [
			
	"Do not switch driver if we are in windows"
	self flag: #TODO. "Hepefully temporal :)"
	Smalltalk platform isWindows ifTrue: [ ^ self ]. 
			
	"If we installed OSGtkDriver, we want to use it as default"
	Smalltalk globals
		at: #OSGtkDriver
		ifPresent: [ :driverClass | OSWindowDriver driverClass: driverClass ]
]

{ #category : #doits }
BaselineOfMars >> postLoad [

	self installGtkDriver.
	self recompileStructures
]

{ #category : #doits }
BaselineOfMars >> recompileStructures [
	"Recompile structures (just to be sure we match everything we need"

	(Smalltalk at: #GtkEnumeration) allSubclassesDo: #initializeEnumeration.
	(Smalltalk at: #GtkStructure) allSubclassesDo: #compileFields.
	(Smalltalk at: #GtkWidget) withAllSubclassesDo: #recompile
]

{ #category : #'external projects' }
BaselineOfMars >> spec2: spec [

	spec baseline: 'SpecCore' with: [ 
		spec repository: 'github://pharo-spec/Spec' ]
]

{ #category : #'external projects' }
BaselineOfMars >> taskit: spec [

	spec 
		baseline: 'TaskIt' 
		with: [ 
			spec 
				repository: 'github://pharo-contributions/taskit';
				loads: #('minimal') ]
]

{ #category : #'external projects' }
BaselineOfMars >> threadedffi: spec [

	spec baseline: 'ThreadedFFI' with: [ 
		spec repository: 'github://pharo-project/threadedFFI-Plugin' ]
]
