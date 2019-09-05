Class {
	#name : #GtkSourceCompletionProvider,
	#superclass : #GObject,
	#instVars : [
		'completionContext'
	],
	#pools : [
		'GtkSourceCompletionActivation'
	],
	#category : #'Mars-Gtk-SourceView'
}

{ #category : #'class initialization' }
GtkSourceCompletionProvider class >> gClass [

	^ GClass gClassAt: self
]

{ #category : #'class initialization' }
GtkSourceCompletionProvider class >> gDefine: gClass [

	gClass
		addInterface: GtkSourceCompletionProviderIface 
		initialize: [ :interface | self gDefineCompletionProviderInterface: interface ]
]

{ #category : #'class initialization' }
GtkSourceCompletionProvider class >> gDefineCompletionProviderInterface: interface [

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
GtkSourceCompletionProvider class >> gInstance: handle [

	^ self gClass findInstance: handle
]

{ #category : #'instance creation' }
GtkSourceCompletionProvider class >> new [

	^ (GClass gDefinitionAt: self) new
]

{ #category : #accessing }
GtkSourceCompletionProvider >> activateProposal: proposal iter: iter [
	| word |
	
	word := self currentWord: iter.
	word ifNil: [ ^ false ].
	iter buffer insertTextAtCursor: (proposal label allButFirst: word size).
 
	^ true
]

{ #category : #accessing }
GtkSourceCompletionProvider >> activation [

	^ GTK_SOURCE_COMPLETION_ACTIVATION_INTERACTIVE value
]

{ #category : #private }
GtkSourceCompletionProvider >> completionEntriesFor: word [
	completionContext ifNil: [ 
		completionContext := NECContext
			controller: NECController new
			class: Object
			source: ''
			position: 0.
		completionContext model ].
	
	completionContext narrowWith: word.
	^ completionContext model entries
		
	
]

{ #category : #private }
GtkSourceCompletionProvider >> currentWord: iter [
	| start line |
		
	start := iter copyInMemory lineOffset: 0.
	line := (iter buffer 
		textStart: start 
		end: iter
		includeHiddenChars: false).
	(line isEmpty or: [ Character separators includes: line last ]) 
		ifTrue: [ ^ nil ].
	^ line substrings last
]

{ #category : #accessing }
GtkSourceCompletionProvider >> match: context [
	
	^ true
]

{ #category : #accessing }
GtkSourceCompletionProvider >> name [

	^ 'Pharo'
]

{ #category : #accessing }
GtkSourceCompletionProvider >> populate: context [
	| proposals iter word |

	(iter := context iter) ifNil: [ ^ self ].
	word := self currentWord: iter.
	word ifNil: [ ^ self ].

	proposals := GList new.
	(self completionEntriesFor: word) do: [ :each |
		proposals append: (GtkSourceCompletionItem newLabel: each contents) ].
	
	context 
		addProposals: proposals 
		provider: self 
		finished: true
]

{ #category : #accessing }
GtkSourceCompletionProvider >> priority [

	^ 1
]

{ #category : #accessing }
GtkSourceCompletionProvider >> startIterContext: context proposal: proposal iter: iter [

	^ true
]
