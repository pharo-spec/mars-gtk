Class {
	#name : #GtkPharoCompletionProvider,
	#superclass : #GObject,
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
			signature: #(void (void *provider)) 
			block: [ :provider | 
				(self gInstance: provider) name ]);
		get_priority: (GCallback 
			signature: #(gint (void *provider)) 
			block: [ :provider | 
				(self gInstance: provider) priority ]);
		populate: (GCallback 
			signature: #(void (void *provider, void *context))
			block: [ :provider :context | 
				(self gInstance: provider) populate: (GtkSourceCompletionContext fromHandle: context) ])
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
GtkPharoCompletionProvider >> name [

	^ 'Pharo'
]

{ #category : #accessing }
GtkPharoCompletionProvider >> populate: context [
	| proposals |
	
	proposals := GList new.
	proposals append: (GtkSourceCompletionItem newLabel: 'a1').
	proposals appendString: (GtkSourceCompletionItem newLabel: 'a2').
	proposals appendString: (GtkSourceCompletionItem newLabel: 'a3').
	
	context 
		addProposals: proposals 
		provider: self 
		finished: true
]

{ #category : #accessing }
GtkPharoCompletionProvider >> priority [

	^ 0
]
