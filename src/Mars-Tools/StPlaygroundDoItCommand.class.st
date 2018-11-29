Class {
	#name : #StPlaygroundDoItCommand,
	#superclass : #LtCommand,
	#category : #'Mars-Tools-Playground'
}

{ #category : #accessing }
StPlaygroundDoItCommand class >> activations [

	^ { self toolBarActivation }
]

{ #category : #accessing }
StPlaygroundDoItCommand class >> toolBarActivation [

	^ LtToolBarActivation new 
		order: 10;
		yourself
]

{ #category : #execution }
StPlaygroundDoItCommand >> execute [ 

	self inform: 'TODO'
]

{ #category : #initialization }
StPlaygroundDoItCommand >> initialize [ 
	
	super initialize.
	self 
		addGroup: StPlaygroundCommandGroup uniqueInstance;
		name: 'Do it';
		description: 'Do it all and inspect.';
		iconName: #glamorousGo
]
