Class {
	#name : #GtkExampleBrowserCategory,
	#superclass : #Object,
	#instVars : [
		'stack'
	],
	#category : #'Mars-Gtk-Examples'
}

{ #category : #'instance-creation' }
GtkExampleBrowserCategory class >> on: aGtkStack [ 
	
	^ self new
		stack: aGtkStack;
		yourself
]

{ #category : #examples }
GtkExampleBrowserCategory >> addExample: example [ 
	
	stack
		addChild: (GtkNotebook new
			append: (GtkGrid new
				attach: example widget left: 0 top: 0 width: 1 height: 1;
				yourself)
			label: (GtkLabel newLabel: 'Widget');
			append: (GtkTextView new
				text: example sourceCode;
				yourself)
			label: (GtkLabel newLabel: 'SourceCode'))
		withTitle: example title.
]

{ #category : #accessing }
GtkExampleBrowserCategory >> stack: aGtkStack [ 
	stack := aGtkStack
]
