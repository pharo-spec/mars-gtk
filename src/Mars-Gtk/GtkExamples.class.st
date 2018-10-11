Class {
	#name : #GtkExamples,
	#superclass : #Object,
	#category : 'Mars-Gtk-Examples'
}

{ #category : #examples }
GtkExamples class >> exampleMorphView [
	<example>

	GtkApplication ensureRunning.

	GtkWindow new 
		autoRelease;
		title: 'MorphView example';
		resize: 500@200;
		add: (GtkMorphView newMorph: (Morph new));
		center;
		showAll;
		inspect
]

{ #category : #examples }
GtkExamples class >> exampleNotebook [
	<example>

	GtkApplication ensureRunning.
	
	GtkWindow new 
		autoRelease;
		title: 'Notebook example';
		resize: 500@200;
		add: (GtkNotebook new 
			append: ((GtkBox newVerticalSpacing: 5) 
					packStart: (GtkLabel newLabel: 'panel 1');
					packStart: ((GtkButton newLabel: 'test button 1')
						connectClicked: [ self inform: 'Ok!' ];
						yourself);
					yourself) 
				label: (GtkLabel newLabel: 'page 1');
			append: (GtkLabel newLabel: 'panel 2') label: (GtkLabel newLabel: 'page 2');
		yourself);
		center;
		showAll;
		inspect
]

{ #category : #examples }
GtkExamples class >> exampleTextView [
	<example>

	GtkApplication ensureRunning.

	GtkWindow new 
		autoRelease;
		title: 'TextView example';
		resize: 500@200;
		add: (GtkScrolledWindow newWidget: GtkTextView new);
		center;
		showAll;
		inspect
]

{ #category : #examples }
GtkExamples class >> exampleToolbar [
	<example>
	| toolBar |

	GtkApplication ensureRunning.
	
	toolBar := GtkToolbar new
		beIconSizeSmallToolbar;
		beIcons; "beIcons, beText, beBoth"
		add: ((GtkToolButton
			newIcon: (GtkImage newStock: 'gtk-ok')
			label: 'Ok form stock')
			tooltipText: 'Ok from stock';
			connectClicked: [ self inform: 'Ok from stock' ];
			yourself);
		add: ((GtkToolButton
			newIcon: (GtkImage newStock: 'gtk-cancel')
			label: 'Cancel from stock')
			tooltipText: 'Cancel from stock';
			connectClicked: [ self inform: 'Cancel from stock' ];
			yourself);
		add: ((GtkToolButton
			newIcon: (GtkImage newForm: (self iconNamed: #smallOk))
			label: 'Ok from Pharo')
			tooltipText: 'Ok from Pharo';
			connectClicked: [ self inform: 'Ok from Pharo' ];
			yourself);
		add: ((GtkToolButton
			newIcon: (GtkImage newForm: (self iconNamed: #smallCancel))
			label: 'Cancel from Pharo')
			tooltipText: 'Cancel from Pharo';
			connectClicked: [ self inform: 'Cancel from Pharo' ];
			yourself);
		yourself.
	
	GtkWindow new
		autoRelease;
		title: 'Toolbar example';
		add:(GtkBox newVertical
			packStart: toolBar expand: false fill: false padding: 5;
			packStart: (GtkLabel newLabel: 'panel');
			yourself);
		resize: 700 @ 200;
		center;
		showAll;
		inspect
]

{ #category : #'see class side' }
GtkExamples >> seeClassSide [
]
