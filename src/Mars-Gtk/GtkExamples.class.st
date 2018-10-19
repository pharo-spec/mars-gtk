Class {
	#name : #GtkExamples,
	#superclass : #Object,
	#category : 'Mars-Gtk-Examples'
}

{ #category : #'examples-buttons' }
GtkExamples class >> exampleButton [
	<example>

	| button |
	GtkApplication ensureRunning.

	button := GtkButton newLabel: 'Hello'.
	button connectClicked: [ button label: button label, ' 今' ].

	GtkWindow new 
		autoRelease;
		title: 'Button example with no relief';
		resize: 500@200;
		add: button;
		center;
		showAll;
		inspect
]

{ #category : #'examples-buttons' }
GtkExamples class >> exampleButtonWithNoRelief [
	<example>

	| button |
	GtkApplication ensureRunning.

	button := GtkButton newLabel: 'Hello'.
	button setNoRelief.
	button connectClicked: [ button label: button label, ' 今' ].

	GtkWindow new 
		autoRelease;
		title: 'Button example';
		resize: 500@200;
		add: button;
		center;
		showAll;
		inspect
]

{ #category : #'examples-buttons' }
GtkExamples class >> exampleButtonWithUnderline [
	<example>

	| button |
	GtkApplication ensureRunning.

	button := GtkButton new.
	button useUnderline.
	button label: '_Hello'.
	button connectClicked: [ button label: button label, ' 今' ].

	GtkWindow new 
		autoRelease;
		title: 'Button example';
		resize: 500@200;
		add: button;
		center;
		showAll;
		inspect
]

{ #category : #examples }
GtkExamples class >> exampleForm [
	<example>
	| grid actionBar textInput numberInput textArea |

	GtkApplication ensureRunning.

	grid := GtkGrid new
		"rowHomogeneous: true;"
		borderWidth: 20;
		columnSpacing: 10;
		rowSpacing: 5;
		"field one"
		attach: (GtkLabel newLabel: 'Text input') at: 1@1;
		attach: ((textInput := GtkEntry new)
				hExpand: true; "just one is needed, the other components follow"
				activatesDefault: true;
				placeHolderText: 'Something interesting';
				yourself) 
			at: 2@1;
		"field two"
		attach: (GtkLabel newLabel: 'Number input') at: 1@2;
		attach: ((numberInput := GtkSpinButton 
					newAdjustment: (GtkAdjustment newDefault)
					climbRate: 1.0 
					digits: 0)
				beNumber;
				activatesDefault: true;
				placeHolderText: '42';
				yourself) 
			at: 2@2;
		"field three"
		attach: (GtkLabel newLabel: 'Text area') at: 1@3;
		attach: (GtkScrolledWindow newWidget: (textArea := GtkTextView new)) at: 2@3 span: 1@2;
		yourself.
		
	actionBar := GtkActionBar new
		packEnd: ((GtkButton newLabel: 'Cancel')
			connectClicked: [ self inform: 'Cancelled!' ];
			yourself);
		packEnd: ((GtkButton newLabel: 'Accept')
			grabDefault;
			connectClicked: [ 
				self inform: ('Accepted: {1}, {2}, {3}' format: { 
					textInput text. 
					numberInput valueAsInt.
					textArea text }) ];
			yourself);
		yourself.
		
	GtkWindow new
		autoRelease;
		title: 'Toolbar example';
		resize: 400 @ 400;
		add:(GtkBox newVertical 
			packStart: grid;
			packEnd: actionBar expand: false fill: false padding: 0;
			yourself);
		center;
		showAll;
		inspect
]

{ #category : #'examples-buttons' }
GtkExamples class >> exampleLinkButton [
	<example>

	| button |
	GtkApplication ensureRunning.

	button := GtkLinkButton newWithUri: 'https://pharo.org' withLabel: 'go to pharo.org'.

	GtkWindow new 
		autoRelease;
		title: 'Link Button example';
		resize: 500@200;
		add: button;
		center;
		showAll;
		inspect
]

{ #category : #examples }
GtkExamples class >> exampleListBox [
	<example>

	GtkApplication ensureRunning.

	GtkWindow new 
		autoRelease;
		title: 'ListBox example';
		resize: 500@200;
		add: (GtkBox newVertical 
			packStart: (GtkListBox new
				listModel: (GtkSimpleListModel newItems: #('One' 'Two' 'Three'));
				yourself);
			yourself);
		center;
		showAll;
		inspect
]

{ #category : #examples }
GtkExamples class >> exampleListView [
	<example>
	| store list renderer |
	
	GtkApplication ensureRunning.
	
	store := GtkListStore newWithColumnTypes: { GType G_TYPE_STRING .  GType G_TYPE_STRING }.

	100 timesRepeat: [
		store appendRow
			atColumnIndex: 0 setValue: 'Hey!' utf8Encoded;
			atColumnIndex: 1 setValue: '1' utf8Encoded.
		store appendRow atColumnIndex: 0 setValue: 'Encoded 今' utf8Encoded;
			atColumnIndex: 1 setValue: '2' utf8Encoded.
		store appendRow atColumnIndex: 0 setValue: 'Benoît, Hürlz, ƒåΩ®¥' utf8Encoded;
			atColumnIndex: 1 setValue: '3' utf8Encoded. ].
	
	list := GtkTreeView new.
	list model: store.

	renderer := GtkCellTextRenderer new.
	list appendColumn: (GtkTreeViewColumn new
		title: 'Example Column Tìtlé';
		renderer: renderer;
		setAttribute: 'text' toColumAtIndex: 0 forRenderer: renderer).
	list appendColumn: (GtkTreeViewColumn new
		title: 'Another Column アイウエオ';
		renderer: renderer;
		setAttribute: 'text' toColumAtIndex: 1 forRenderer: renderer).

	GtkWindow new 
		autoRelease;
		title: 'Simple List Example';
		resize: 500@500;
		add: (GtkScrolledWindow newWidget: list);
		center;
		showAll;
		inspect
]

{ #category : #examples }
GtkExamples class >> exampleMenuBar [
	<example>
	| menuBar fileMenu fileMenuItem quitMenuItem |

	GtkApplication ensureRunning.
		
	menuBar := GtkMenuBar new.
	fileMenu := GtkMenu new.
	fileMenuItem := GtkMenuItem newLabel: 'File'.

	fileMenuItem submenu: fileMenu.
	quitMenuItem := GtkMenuItem newLabel: 'Quit'.
	quitMenuItem connectActivate: [ self inform: 'No way!' ].
	fileMenu add: quitMenuItem.

	menuBar add: fileMenuItem.

	GtkWindow new
		resize: 600@400;
		add: (GtkBox newVertical
			packStart: menuBar expand: false fill: false padding: 0;
			yourself);
		inspect;
		showAll.

]

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

{ #category : #'examples-buttons' }
GtkExamples class >> exampleRadioButton [
	<example>

	| button |
	GtkApplication ensureRunning.

	button := GtkRadioButton newLabel: 'Option 1'.

	GtkWindow new 
		autoRelease;
		title: 'Toggle Button example';
		resize: 500@200;
		add: (GtkBox newVertical
			packStart: button;
			packStart: (GtkRadioButton
				buttonNewInSameGroupAs: button withLabel: 'Option 2');
			packStart: (GtkRadioButton
				buttonNewInSameGroupAs: button withLabel: 'Option 3');
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

{ #category : #'examples-buttons' }
GtkExamples class >> exampleToggleButton [
	<example>

	| button |
	GtkApplication ensureRunning.

	button := GtkToggleButton newLabel: 'Hello'.

	GtkWindow new 
		autoRelease;
		title: 'Toggle Button example';
		resize: 500@200;
		add: button;
		center;
		showAll;
		inspect
]

{ #category : #'examples-buttons' }
GtkExamples class >> exampleToggleButtonWithoutIndicator [
	<example>

	| button |
	GtkApplication ensureRunning.

	button := GtkToggleButton newLabel: 'Hello'.
	button doNotDrawIndicator.

	GtkWindow new 
		autoRelease;
		title: 'Toggle Button example';
		resize: 500@200;
		add: button;
		center;
		showAll;
		inspect
]

{ #category : #examples }
GtkExamples class >> exampleToolBar [
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
		resize: 700 @ 200;
		add:(GtkBox newVertical
			packStart: toolBar expand: false fill: false padding: 5;
			packStart: (GtkLabel newLabel: 'panel');
			yourself);
		center;
		showAll;
		inspect
]

{ #category : #examples }
GtkExamples class >> exampleTreeView [
	<example>
	| store tree renderer |
	
	GtkApplication ensureRunning.
	
	store := GtkTreeStore newWithColumnTypes: { GType G_TYPE_STRING .  GType G_TYPE_STRING }.

	100 timesRepeat: [ | row |
		row := store appendRow
			atColumnIndex: 0 setValue: 'Hey!' utf8Encoded;
			atColumnIndex: 1 setValue: '1' utf8Encoded;
			yourself.
		row newChild
			atColumnIndex: 0 setValue: 'Childddd' utf8Encoded;
			atColumnIndex: 1 setValue: '11321' utf8Encoded.
		row newChild
			atColumnIndex: 0 setValue: 'Encoded 今' utf8Encoded;
			atColumnIndex: 1 setValue: '2' utf8Encoded.
		row newChild
			atColumnIndex: 0 setValue: 'Benoît, Hürlz, ƒåΩ®¥' utf8Encoded;
			atColumnIndex: 1 setValue: '3' utf8Encoded.].
	
	tree := GtkTreeView new.
	tree model: store.

	renderer := GtkCellTextRenderer new.
	tree appendColumn: (GtkTreeViewColumn new
		title: 'Example Column Tìtlé';
		renderer: renderer;
		setAttribute: 'text' toColumAtIndex: 0 forRenderer: renderer).
	tree appendColumn: (GtkTreeViewColumn new
		title: 'Another Column アイウエオ';
		renderer: renderer;
		setAttribute: 'text' toColumAtIndex: 1 forRenderer: renderer).
		
	tree addExpanderColumn.
	tree enableTreeLines.

	GtkWindow new 
		autoRelease;
		title: 'Simple List Example';
		resize: 500@500;
		add: (GtkScrolledWindow newWidget: tree);
		center;
		showAll;
		inspect
]

{ #category : #'examples-buttons' }
GtkExamples class >> exampleVolumeButton [
	<example>

	| button |
	GtkApplication ensureRunning.

	GtkWindow new 
		autoRelease;
		title: 'Volume Button example';
		resize: 500@200;
		add: (GtkBox newVertical
			packStart: GtkVolumeButton new;
			packStart: GtkVolumeButton new;
			yourself);
		center;
		showAll;
		inspect
]

{ #category : #'see class side' }
GtkExamples >> seeClassSide [
]
