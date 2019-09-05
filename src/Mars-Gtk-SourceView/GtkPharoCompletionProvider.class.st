Class {
	#name : #GtkPharoCompletionProvider,
	#superclass : #GObject,
	#pools : [
		'GtkSourceCompletionActivation'
	],
	#category : #'Mars-Gtk-SourceView'
}

{ #category : #'class initialization' }
GtkPharoCompletionProvider class >> gClass [

	^ GClass gClassAt: self
]

{ #category : #'class initialization' }
GtkPharoCompletionProvider class >> gDefine: gClass [

	gClass
		addInterface: GtkSourceCompletionProviderIface 
		initialize: [ :interface | self gDefineCompletionProviderInterface: interface ]
]

{ #category : #'class initialization' }
GtkPharoCompletionProvider class >> gDefineCompletionProviderInterface: interface [

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
GtkPharoCompletionProvider class >> gInstance: handle [

	^ self gClass findInstance: handle
]

{ #category : #'instance creation' }
GtkPharoCompletionProvider class >> new [

	^ (GClass gDefinitionAt: self) new
]

{ #category : #accessing }
GtkPharoCompletionProvider >> activateProposal: proposal iter: iter [
	| word |
	
	word := self currentWord: iter.
	word ifNil: [ ^ false ].
	iter buffer insertTextAtCursor: (proposal label allButFirst: word size).
 
	^ true
]

{ #category : #accessing }
GtkPharoCompletionProvider >> activation [

	^ GTK_SOURCE_COMPLETION_ACTIVATION_INTERACTIVE value
]

{ #category : #private }
GtkPharoCompletionProvider >> currentWord: iter [
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
GtkPharoCompletionProvider >> match: context [
	
	^ true
]

{ #category : #accessing }
GtkPharoCompletionProvider >> name [

	^ 'Pharo'
]

{ #category : #accessing }
GtkPharoCompletionProvider >> populate: context [
	| proposals iter word |

	(iter := context iter) ifNil: [ ^ self ].
	word := self currentWord: iter.
	word ifNil: [ ^ self ].

	proposals := GList new. 
	proposals append: (GtkSourceCompletionItem newLabel: word, '1').
	proposals append: (GtkSourceCompletionItem newLabel: word, '2').
	proposals append: (GtkSourceCompletionItem newLabel: word, '3').
	
	context 
		addProposals: proposals 
		provider: self 
		finished: true
]

{ #category : #accessing }
GtkPharoCompletionProvider >> priority [

	^ 1
]

{ #category : #accessing }
GtkPharoCompletionProvider >> startIterContext: context proposal: proposal iter: iter [

	^ true
]
