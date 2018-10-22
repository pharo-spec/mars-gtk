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
			append: (GtkScrolledWindow newWidget: example widget)
			label: (GtkLabel newLabel: 'Widget');
			append: (GtkTextView new
				monospace: true;
				text: example sourceCode;
				yourself)
			label: (GtkLabel newLabel: 'SourceCode'))
		withTitle: example title.
]

{ #category : #accessing }
GtkExampleBrowserCategory >> stack: aGtkStack [ 
	stack := aGtkStack
]
