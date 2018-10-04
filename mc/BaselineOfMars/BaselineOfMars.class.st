Class {
	#name : #BaselineOfMars,
	#superclass : #BaselineOf,
	#category : 'BaselineOfMars'
}

{ #category : #baseline }
BaselineOfMars >> baseline: spec [
	<baseline>
	spec for: #common do: [
		self beacon: spec.
		self magritte3: spec.
		spec
			package: 'Mars-Gtk' with: [ spec requires: 'Beacon' ];
			package: 'Mars-Magritte' with: [ spec requires: #('Mars-Gtk' 'Magritte3') ] ]
]

{ #category : #'external projects' }
BaselineOfMars >> beacon: spec [
	spec project: 'Beacon' with: [ 
		spec
			className: 'ConfigurationOfBeacon';
			versionString: #'development';
			repository: 'http://smalltalkhub.com/mc/Pharo/Beacon/main' ]
]

{ #category : #'external projects' }
BaselineOfMars >> magritte3: spec [
	spec project: 'Magritte3' with: [ 
		spec
			className: 'ConfigurationOfMagritte3';
			versionString: '3.3.2';
			loads: #('Core' 'Magritte-Morph');
			repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main' ]
]
