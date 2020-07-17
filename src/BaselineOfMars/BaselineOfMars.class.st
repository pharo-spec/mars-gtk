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
			self spec: spec.
			self specCode: spec.
			self specMorphic: spec.
			self threadedffi: spec.
			self beacon: spec.
			self taskit: spec.
			
			spec postLoadDoIt: #postLoad.

			spec
				"core"
				package: 'Mars-Pango';
				package: 'Mars-Gtk' with: [ spec requires: #('ThreadedFFI' 'Beacon' 'Mars-Pango') ];
				"code"
				package: 'Mars-Gtk-SourceView' with: [ spec requires: #('Mars-Gtk') ];
				"morphic"
				package: 'Mars-Gtk-Morphic' with: [ spec requires: #('Mars-Gtk') ];
				package: 'Mars-Gtk-Morphic-UIManager' with: [ spec requires: #('Mars-Gtk-Morphic') ];
				"spec"
				package: 'Mars-Spec-Frame' with: [ spec requires: #('SpecCore') ];
				package: 'Mars-Spec-Keybindings' with: [ spec requires: #('Mars-Gtk') ];
				package: 'Mars-Spec' with: [ spec requires: #('Mars-Gtk' 'Mars-Spec-Keybindings') ];
				"spec-code"
				package: 'Mars-Spec-Code' with: [ spec requires: #('SpecCode' 'Mars-Spec') ];
				package: 'Mars-Spec-Pillar' with: [ spec requires: #('Mars-Spec') ];
				"spec-morphic"
				package: 'Mars-Gtk-Morphic-Adapter' with: [ spec requires: #('SpecMorphic' 'Mars-Gtk-Morphic' 'Mars-Spec') ];
				"testing"
				package: 'Mars-GtkBackendTests' with: [ spec requires: 'Mars-Spec' ];
				package: 'Mars-Gtk-Tests' with: [ spec requires: 'Mars-Gtk' ];
				"testing morphic"
				package: 'Mars-Gtk-Morphic-Tests' with: [ spec requires: 'Mars-Gtk-Morphic' ] ].
		
		spec group: 'Core' with: #('SpecCore' 'Mars-Pango' 'Mars-Gtk' 'Mars-Spec-Frame' 'Mars-Spec-Keybindings' 'Mars-Spec').
		spec group: 'Code' with: #('Mars-Gtk-SourceView' 'Mars-Spec-Code').	
		spec group: 'Morphic' with: #('Mars-Gtk-Morphic' 'Mars-Gtk-Morphic-UIManager' 'Mars-Gtk-Morphic-Adapter').
		spec group: 'Tests' with: #('Mars-GtkBackendTests' 'Mars-Gtk-Tests').
		spec group: 'MorphicTests' with: #('Mars-Gtk-Morphic-Tests').
		
		spec group: 'Base' with: #('Core' 'Code').
		
		spec group: 'default' with: #('Base' 'Tests' 'Morphic' 'MorphicTests')
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
BaselineOfMars >> spec: spec [

	spec baseline: 'SpecCore' with: [ 
		spec 
			repository: 'github://pharo-spec/Spec';
			loads: 'Core' ]
]

{ #category : #'external projects' }
BaselineOfMars >> specCode: spec [

	spec baseline: 'SpecCode' with: [ 
		spec 
			repository: 'github://pharo-spec/Spec';
			className: 'BaselineOfSpecCore';
			loads: 'Code' ]
]

{ #category : #'external projects' }
BaselineOfMars >> specMorphic: spec [

	spec baseline: 'SpecMorphic' with: [ 
		spec 
			repository: 'github://pharo-spec/Spec';
			className: 'BaselineOfSpec2' ]
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
		spec 
			repository: 'github://pharo-project/threadedFFI-Plugin';
			loads: 'Core' ]
]
