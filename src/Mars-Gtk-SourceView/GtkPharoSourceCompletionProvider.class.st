"
This is a completion provider for Pharo Source.
It implements a GtkSourceCompletionProviderIface (see gDefine: and gDefineCompletionProviderInterface: interface)
It uses CompletionContext to provide useful completions in editors.

"
Class {
	#name : #GtkPharoSourceCompletionProvider,
	#superclass : #GObject,
	#instVars : [
		'completionClass'
	],
	#pools : [
		'GtkSourceCompletionActivation'
	],
	#category : #'Mars-Gtk-SourceView'
}

{ #category : #'class initialization' }
GtkPharoSourceCompletionProvider class >> gClass [

	^ GClass gClassAt: self
]

{ #category : #'class initialization' }
GtkPharoSourceCompletionProvider class >> gDefine: gClass [

	gClass
		addInterface: GtkSourceCompletionProviderIface 
		initialize: [ :interface | self gDefineCompletionProviderInterface: interface ]
]

{ #category : #'class initialization' }
GtkPharoSourceCompletionProvider class >> gDefineCompletionProviderInterface: interface [

	interface
		get_name: (GCallback
			signature: #(gchar *(void *provider)) 
			block: [ :provider | (self gInstance: provider) name ]);
		get_icon: (GCallback
			signature: #(void *(void *provider)) 
			block: [ :provider | ExternalAddress null ]);
		get_priority: (GCallback 
			signature: #(gint (void *provider)) 
			block: [ :provider | 1 ]);
		get_activation: (GCallback 
			signature: #(uint32 (void *provider)) 
			block: [ :provider | (self gInstance: provider) activation ]);
		get_interactive_delay: (GCallback 
			signature: #(gint (void *provider)) 
			block: [ :provider | -1 ]);
		match: (GCallback 
			signature: #(gboolean (void *provider, void *context))
			block: [ :provider :context | 
				(self gInstance: provider) match: (GtkSourceCompletionContext fromHandle: context) ]);
		match: (GCallback 
			signature: #(gboolean (void *provider, void *context, void *proposal, void *iter))
			block: [ :provider :context :proposal :iter | 
				(self gInstance: provider) 
					startIterContext: (GtkSourceCompletionContext fromHandle: context)
					proposal: (GtkSourceCompletionItem fromHandle: proposal)
					iter: (GtkTextIter fromHandle: iter) ]);
		populate: (GCallback
			signature: #(void (void *provider, void *context))
			block: [ :provider :context | 
				(self gInstance: provider) populate: (GtkSourceCompletionContext fromHandle: context) ]);
		activate_proposal: (GCallback 
			signature: #(gboolean (void *provider, void *proposal, void *iter))
			block: [ :provider :proposal :iter |
				(self gInstance: provider) 
					activateProposal: (GtkSourceCompletionItem fromHandle: proposal)
					iter: (GtkTextIter fromHandle: iter) ])
]

{ #category : #'class initialization' }
GtkPharoSourceCompletionProvider class >> gInstance: handle [

	^ self gClass findInstance: handle
]

{ #category : #'instance creation' }
GtkPharoSourceCompletionProvider class >> new [

	^ (GClass gDefinitionAt: self) new
]

{ #category : #accessing }
GtkPharoSourceCompletionProvider >> activateProposal: proposal iter: iter [
	| word |
	
	word := self currentWord: iter in: iter buffer.
	word ifNil: [ ^ false ].
	self flag: #TODO. "Decide if we add a space at the end is a decision that can be configurable"
	iter buffer insertTextAtCursor: ((proposal label allButFirst: word size) copyWith: Character space).
 
	^ true
]

{ #category : #accessing }
GtkPharoSourceCompletionProvider >> activation [

	^ GTK_SOURCE_COMPLETION_ACTIVATION_INTERACTIVE value
]

{ #category : #accessing }
GtkPharoSourceCompletionProvider >> completionClass: aClass [
	"The class in which we execute the completion (it can be nil)"

	completionClass := aClass
]

{ #category : #private }
GtkPharoSourceCompletionProvider >> completionEntriesFor: iter [
	| completionContext word textBuffer |

	textBuffer := iter buffer.
	completionContext := CompletionContext
		controller: nil
		class: completionClass
		source: textBuffer text
		position: iter offset.

	word := self currentWord: iter in: textBuffer.
	word ifNil: [ ^ #() ].

	completionContext narrowWith: word.
	
	^ completionContext model entries
]

{ #category : #private }
GtkPharoSourceCompletionProvider >> currentWord: iter in: textBuffer [
	| start line |
		
	start := iter copyInMemory lineOffset: 0.
	line := (textBuffer 
		textStart: start 
		end: iter
		includeHiddenChars: false).
	(line isEmpty or: [ Character separators includes: line last ]) 
		ifTrue: [ ^ nil ].
	^ line substrings last
]

{ #category : #accessing }
GtkPharoSourceCompletionProvider >> match: context [
	
	^ true
]

{ #category : #accessing }
GtkPharoSourceCompletionProvider >> name [

	^ 'Pharo'
]

{ #category : #accessing }
GtkPharoSourceCompletionProvider >> populate: context [
	| proposals iter |

	(iter := context iter) ifNil: [ ^ self ].

	proposals := GList new.
	(self completionEntriesFor: iter) do: [ :each |
		proposals append: (self toItem: each) ].
	
	context 
		addProposals: proposals 
		provider: self 
		finished: true
]

{ #category : #accessing }
GtkPharoSourceCompletionProvider >> priority [

	^ 1
]

{ #category : #accessing }
GtkPharoSourceCompletionProvider >> startIterContext: context proposal: proposal iter: iter [

	^ true
]

{ #category : #private }
GtkPharoSourceCompletionProvider >> toItem: aCompletionEntry [

	^ GtkSourceCompletionItem newLabel: aCompletionEntry contents
]
