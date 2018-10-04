Class {
	#name : #GtkExamples,
	#superclass : #Object,
	#category : 'Mars-Gtk-Examples'
}

{ #category : #examples }
GtkExamples class >> exampleNotebook [
	<example>
	GtkApplication new run.
	GtkWindow new 
		autoRelease;
		title: 'Notebook example';
		resize: 500@200;
		add: (GtkNotebook new 
			append: ((GtkBox newVerticalSpacing: 5) 
					packStart: (GtkLabel newLabel: 'panel 1');
					packStart: (GtkButton newLabel: 'test button 1');
					yourself) 
				label: (GtkLabel newLabel: 'page 1');
			append: (GtkLabel newLabel: 'panel 2') label: (GtkLabel newLabel: 'page 2');
		yourself);
		center;
		showAll;
		inspect
]

{ #category : #examples }
GtkExamples class >> exampleToolbar [
	<example>
	
	GtkApplication new run.
	GtkWindow new 
		autoRelease;
		title: 'Toolbar example';
		resize: 500@200;
		add: (GtkBox newVertical
			packStart: (GtkToolbar new
					beIconSizeSmallToolbar;
					beIcons; "beIcons, beText, beBoth"
					add: ((GtkToolButton newIcon: (GtkImage newStock: 'gtk-ok') label: 'Ok form stock')
						tooltipText: 'Ok form stock';
						connectClicked: [ self inform: 'Ok from stock' ];
						yourself);
					add: ((GtkToolButton newIcon: (GtkImage newStock: 'gtk-cancel') label: 'Cancel from stock')
						tooltipText: 'Cancel from stock';
						connectClicked: [ self inform: 'Cancel from stock' ];
						yourself);
					add: ((GtkToolButton newIcon: (GtkImage newForm: #smallOk asIcon) label: 'Ok from Pharo')
						tooltipText: 'Ok from Pharo';
						connectClicked: [ self inform: 'Ok from Pharo' ];
						yourself);
					add: ((GtkToolButton newIcon: (GtkImage newForm: #smallCancel asIcon) label: 'Cancel from Pharo')
						tooltipText: 'Cancel from Pharo';
						connectClicked: [ self inform: 'Cancel from Pharo' ];
						yourself);
					yourself)
				expand: false 
				fill: false 
				padding: 5;
			packStart: (GtkLabel newLabel: 'panel');
			yourself);
		center;
		showAll;
		inspect
]

{ #category : #'see class side' }
GtkExamples >> seeClassSide [
]
