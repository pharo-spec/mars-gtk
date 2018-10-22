Class {
	#name : #GtkExamples,
	#superclass : #Object,
	#category : 'Mars-Gtk-Examples'
}

{ #category : #'examples-windows' }
GtkExamples class >> exampleAboutDialow [
	<example>

	GtkApplication ensureRunning.

	GtkWindow new 
		autoRelease;
		title: thisContext method selector asString;
		resize: 500@200;
		add: ((GtkButton newLabel: 'Show Dialog')
			connectClicked: [ | dialog |
				dialog := GtkAboutDialog new
					comments: 'Comments';
					licence: 'MIT';
					programName: 'Pharo Gtk Bindings';
					version: '0.1.2-alpha';
					website: 'http://pharo.org';
					websiteLabel: 'http://pharo.org';
					copyright: 'The Pharo Community';
					run;
					destroy ];
			yourself);
		center;
		showAll;
		inspect
]

{ #category : #'examples-basic' }
GtkExamples class >> exampleAccelLabel [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-buttons' }
GtkExamples class >> exampleButton [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-containers' }
GtkExamples class >> exampleButtonBoxExpandToFill [
	<example>

	self gtkExampleButtonBoxDoing: [ :box | box expandToFill ]
]

{ #category : #'examples-containers' }
GtkExamples class >> exampleButtonBoxPlaceAtCenter [
	<example>

	self gtkExampleButtonBoxDoing: [ :box | box placeAtCenter ]
]

{ #category : #'examples-containers' }
GtkExamples class >> exampleButtonBoxPlaceAtEdges [
	<example>

	self gtkExampleButtonBoxDoing: [ :box | box placeAtEdges ]
]

{ #category : #'examples-containers' }
GtkExamples class >> exampleButtonBoxPlaceAtEnd [
	<example>

	self gtkExampleButtonBoxDoing: [ :box | box placeAtEnd ]
]

{ #category : #'examples-containers' }
GtkExamples class >> exampleButtonBoxPlaceAtStart [
	<example>

	self gtkExampleButtonBoxDoing: [ :box | box placeAtStart ]
]

{ #category : #'examples-containers' }
GtkExamples class >> exampleButtonBoxSpreadEvenly [
	<example>

	self gtkExampleButtonBoxDoing: [ :box | box spreadEvenly ]
]

{ #category : #'examples-buttons' }
GtkExamples class >> exampleButtonWithNoRelief [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-buttons' }
GtkExamples class >> exampleButtonWithUnderline [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-buttons' }
GtkExamples class >> exampleCheckButton [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-windows' }
GtkExamples class >> exampleDialow [
	<example>

	GtkApplication ensureRunning.

	GtkWindow new 
		autoRelease;
		title: thisContext method selector asString;
		resize: 500@200;
		add: ((GtkButton newLabel: 'Show Dialog')
			connectClicked: [ | dialog |
				dialog := GtkDialog new
					addButtonWithLabel: 'Yes' withResponseId: 1;
					addButtonWithLabel: 'No' withResponseId: 2;
					yourself.
				self inform: dialog run asString.
				dialog destroy ];
			yourself);
		center;
		showAll;
		inspect
]

{ #category : #'examples-entries' }
GtkExamples class >> exampleEntry [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-entries' }
GtkExamples class >> exampleEntryPassword [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-entries' }
GtkExamples class >> exampleEntryPasswordWithDifferentInvisibleCharacter [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-entries' }
GtkExamples class >> exampleEntryPasswordWithMaxLength [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-entries' }
GtkExamples class >> exampleEntryPasswordWithProgress [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-containers' }
GtkExamples class >> exampleFixed [
	<example>
	
	| container |
	GtkApplication ensureRunning.

	container := GtkFixed new.
	3 timesRepeat: [ | button |
		button := GtkButton newLabel: 'Click me'.
		button connectClicked: [ container moveChild: button to: 200@200 atRandom ].
		container putChild: button at: 50@50 atRandom].

	GtkWindow new 
		autoRelease;
		title: 'Layout';
		defaultSize: 500@200;
		add: (GtkBox newHorizontal
			packStart: container;
			yourself);
		center;
		showAll;
		inspect
]

{ #category : #examples }
GtkExamples class >> exampleForm [
	<example>
	| window grid actionBar textInput numberInput textArea |

	GtkApplication ensureRunning.

	"The window"
	window := GtkWindow new autoRelease.

	"The grid"
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
		"combo box"
		attach: (GtkLabel newLabel: 'Combo box') at: 1@3;
		attach: (GtkComboBoxText newModel: (GtkTreeStore newStrings: #('one' 'two' 'three' 'four')))  at: 2@3;
		"text area"
		attach: (GtkLabel newLabel: 'Text area') at: 1@4;
		attach: (GtkScrolledWindow newWidget: (textArea := GtkTextView new)) at: 2@4 span: 1@3;
		yourself.
		
	"The buttons"
	actionBar := GtkActionBar new
		packEnd: ((GtkButton newLabel: 'Cancel')
			connectClicked: [ window hide ];
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
		
	"Show window"
	window
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

{ #category : #'examples-containers' }
GtkExamples class >> exampleGrid [
	<example>

	| container |
	GtkApplication ensureRunning.

	container := GtkGrid new.

	1 to: 5 do: [ :idx | | button |
		button := GtkButton newLabel: 'Hello ',  idx asString.
		button connectClicked: [ button label: button label, ' 今' ].
		container attach: button at: idx@idx ].

	GtkWindow new 
		autoRelease;
		title: 'Horizontal box';
		resize: 500@200;
		add: container;
		center;
		showAll;
		inspect
]

{ #category : #'examples-containers' }
GtkExamples class >> exampleHeaderBar [
	<example>

	GtkApplication ensureRunning.
	
	GtkWindow new 
		autoRelease;
		resize: 500@200;
		titleBar: (GtkHeaderBar new
			title: 'Window with title';
			subtitle: 'and subtitle';
			packStart: (GtkButton newLabel: 'And button');
			yourself);
		center;
		showAll;
		inspect
]

{ #category : #'examples-containers' }
GtkExamples class >> exampleHorizontalBox [
	<example>

	| container |
	GtkApplication ensureRunning.

	container := GtkBox newHorizontal.

	1 to: 5 do: [ :idx | | button |
		button := GtkButton newLabel: 'Hello ',  idx asString.
		button connectClicked: [ button label: button label, ' 今' ].
		container add: button ].

	GtkWindow new 
		autoRelease;
		title: 'Horizontal box';
		resize: 500@200;
		add: container;
		center;
		showAll;
		inspect
]

{ #category : #'examples-basic' }
GtkExamples class >> exampleImageFromMorph [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-basic' }
GtkExamples class >> exampleImageFromThemeIcon [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-basic' }
GtkExamples class >> exampleInfoBar [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-basic' }
GtkExamples class >> exampleInfoBarDefault [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-basic' }
GtkExamples class >> exampleInfoBarError [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-basic' }
GtkExamples class >> exampleInfoBarQuestion [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-basic' }
GtkExamples class >> exampleInfoBarWarning [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-basic' }
GtkExamples class >> exampleLabel [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-containers' }
GtkExamples class >> exampleLayout [
	<example>
	
	| container |
	GtkApplication ensureRunning.

	container := GtkLayout new.

	1 to: 3 do: [ :idx | | button |
		button := GtkButton newLabel: 'Click me ', idx asString.
		button connectClicked: [ container moveChild: button to: (300 atRandom@200atRandom) ].
		container
			putChild: button at: (300 atRandom@200atRandom);
			yourself ].

	GtkWindow new 
		autoRelease;
		title: 'Layout';
		defaultSize: 500@200;
		add: container;
		center;
		showAll;
		inspect
]

{ #category : #'examples-basic' }
GtkExamples class >> exampleLevelBar [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-buttons' }
GtkExamples class >> exampleLinkButton [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-lists' }
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

{ #category : #'examples-lists' }
GtkExamples class >> exampleListView [
	<example>
	| store list renderer |
	
	GtkApplication ensureRunning.
	
	store := GtkListStore newColumnTypes: { GType G_TYPE_STRING .  GType G_TYPE_STRING }.

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

	renderer := GtkCellRendererText new.
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

{ #category : #'examples-buttons' }
GtkExamples class >> exampleMenuButtonWithMenu [
	<example>
	
	self runExampleFromSender
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

{ #category : #'examples-containers' }
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

{ #category : #'examples-basic' }
GtkExamples class >> exampleProgressBar [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-basic' }
GtkExamples class >> exampleProgressBarInverted [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-basic' }
GtkExamples class >> exampleProgressBarWithText [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-buttons' }
GtkExamples class >> exampleRadioButton [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-containers' }
GtkExamples class >> exampleRevealer [
	<example>

	| container rightRevealer leftRevealer |
	GtkApplication ensureRunning.

	container := GtkBox newHorizontal.
	container add: (leftRevealer := GtkRevealer
		newWithChild: ((GtkButton newLabel: 'Hide me')
			connectClicked: [ 
				leftRevealer hideChild.
				rightRevealer revealChild ];
			yourself)).
	container add: (rightRevealer := GtkRevealer
		newWithChild: (GtkBox newHorizontal
			add: ((GtkButton newLabel: 'Slide Down')
				connectClicked: [ 
					leftRevealer
						setSlideDownTransition;
						revealChild.
					rightRevealer hideChild ];
				yourself);
			add: ((GtkButton newLabel: 'Slide Up')
				connectClicked: [ leftRevealer setSlideUpTransition; revealChild.
					rightRevealer hideChild ];
				yourself);
			add: ((GtkButton newLabel: 'Slide Left')
				connectClicked: [ leftRevealer setSlideLeftTransition; revealChild.
					rightRevealer hideChild ];
				yourself);
			add: ((GtkButton newLabel: 'Slide Right')
				connectClicked: [ leftRevealer setSlideRightTransition; revealChild.
					rightRevealer hideChild ];
				yourself);
			add: ((GtkButton newLabel: 'Crossfade')
				connectClicked: [ leftRevealer setCrossfadeTransition; revealChild.
					rightRevealer hideChild ];
				yourself);
			yourself)) revealChild.

	GtkWindow new 
		autoRelease;
		title: 'Revealer';
		resize: 500@200;
		add: container;
		center;
		showAll;
		inspect
]

{ #category : #'examples-entries' }
GtkExamples class >> exampleScaleHorizontal [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-entries' }
GtkExamples class >> exampleScaleNotDrawingValue [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-entries' }
GtkExamples class >> exampleScaleValueAtLeft [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-entries' }
GtkExamples class >> exampleScaleValueAtTop [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-entries' }
GtkExamples class >> exampleScaleVertical [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-entries' }
GtkExamples class >> exampleScaleWithMarks [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-entries' }
GtkExamples class >> exampleSearchBar [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-entries' }
GtkExamples class >> exampleSearchEntry [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-basic' }
GtkExamples class >> exampleSpinner [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-containers' }
GtkExamples class >> exampleStackWithStackSidebar [
	<example>

	| stack |
	GtkApplication ensureRunning.
	
	stack := GtkStack new 
			addChild: ((GtkBox newVerticalSpacing: 5) 
					packStart: (GtkLabel newLabel: 'panel 1');
					packStart: ((GtkButton newLabel: 'test button 1')
						connectClicked: [ self inform: 'Ok!' ];
						yourself);
					yourself) 
			withTitle: 'page 1';
			addChild: (GtkLabel newLabel: 'panel 2') withTitle: 'page 2';
		yourself.
	
	GtkWindow new 
		autoRelease;
		title: 'Stack example';
		resize: 500@200;
		add: (GtkBox newHorizontal
			add: (GtkStackSidebar forStack: stack);
			add: stack;
			yourself);
		center;
		showAll;
		inspect
]

{ #category : #'examples-containers' }
GtkExamples class >> exampleStackWithStackSwitcher [
	<example>

	| stack |
	GtkApplication ensureRunning.
	
	stack := GtkStack new 
			addChild: ((GtkBox newVerticalSpacing: 5) 
					packStart: (GtkLabel newLabel: 'panel 1');
					packStart: ((GtkButton newLabel: 'test button 1')
						connectClicked: [ self inform: 'Ok!' ];
						yourself);
					yourself) 
			withTitle: 'page 1';
			addChild: (GtkLabel newLabel: 'panel 2') withTitle: 'page 2';
		yourself.
	
	GtkWindow new 
		autoRelease;
		title: 'Stack example';
		resize: 500@200;
		add: (GtkBox newVertical
			add: (GtkStackSwitcher forStack: stack);
			add: stack;
			yourself);
		center;
		showAll;
		inspect
]

{ #category : #'examples-basic' }
GtkExamples class >> exampleStatusBar [
	<example>

	self runExampleFromSender
]

{ #category : #'examples-buttons' }
GtkExamples class >> exampleSwitch [
	<example>

	self runExampleFromSender
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

	self runExampleFromSender
]

{ #category : #'examples-buttons' }
GtkExamples class >> exampleToggleButtonWithoutIndicator [
	<example>

	self runExampleFromSender
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
			newIcon: (GtkImage newIconForLargeToolbarNamed: 'gtk-ok')
			label: 'Ok form stock')
			tooltipText: 'Ok from stock';
			connectClicked: [ self inform: 'Ok from stock' ];
			yourself);
		add: ((GtkToolButton
			newIcon: (GtkImage newIconForLargeToolbarNamed: 'gtk-cancel')
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

{ #category : #'examples-lists' }
GtkExamples class >> exampleTreeView [
	<example>
	| store tree renderer |
	
	GtkApplication ensureRunning.
	
	store := GtkTreeStore newColumnTypes: { GType G_TYPE_STRING .  GType G_TYPE_STRING }.

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

	renderer := GtkCellRendererText new.
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

{ #category : #'examples-containers' }
GtkExamples class >> exampleVerticalBox [
	<example>

	| container |
	GtkApplication ensureRunning.

	container := GtkBox newVertical.

	1 to: 5 do: [ :idx | | button |
		button := GtkButton newLabel: 'Hello ',  idx asString.
		button connectClicked: [ button label: button label, ' 今' ].
		container add: button ].

	GtkWindow new 
		autoRelease;
		title: 'Vertical box';
		resize: 500@200;
		add: container;
		center;
		showAll;
		inspect
]

{ #category : #'examples-buttons' }
GtkExamples class >> exampleVolumeButton [
	<example>

	self runExampleFromSender
]

{ #category : #'private-examples-basic' }
GtkExamples class >> gtExampleAccelLabel [
	<gtkExample>

	| label |
	label := GtkAccelLabel newLabel: 'Hello 今'.
	label
		accelLabelSetAccelKey: 3
		modifiers: GdkModifierType GDK_CONTROL_MASK.
	^ label
]

{ #category : #'private-examples-buttons' }
GtkExamples class >> gtkExampleButton [
	<gtkExample>
	<title: 'Button'>
	<category: #Buttons>

	| button |
	button := GtkButton newLabel: 'Hello'.
	button connectClicked: [ self inform: 'tu vieja' ].
	^ button
]

{ #category : #'private-examples-containers' }
GtkExamples class >> gtkExampleButtonBoxDoing: aBlock [
	
	| container |
	container := GtkButtonBox newHorizontal.
	aBlock value: container.

	1 to: 3 do: [ :idx | | button |
		button := GtkButton newLabel: 'Hello ',  idx asString.
		button connectClicked: [ button label: button label, ' 今' ].
		container packStart: button ].

	^ container
]

{ #category : #'private-examples-containers' }
GtkExamples class >> gtkExampleButtonBoxExpandToFill [
	<gtkExample>
	<title: 'ButtonBox expand to fill'>
	<category: #Containers>

	^ self gtkExampleButtonBoxDoing: [ :box | box expandToFill ]
]

{ #category : #'private-examples-containers' }
GtkExamples class >> gtkExampleButtonBoxPlaceAtCenter [
	<gtkExample>
	<title: 'ButtonBox place at center'>
	<category: #Containers>

	^ self gtkExampleButtonBoxDoing: [ :box | box placeAtCenter ]
]

{ #category : #'private-examples-containers' }
GtkExamples class >> gtkExampleButtonBoxPlaceAtEdges [
	<gtkExample>
	<title: 'ButtonBox place at edges'>
	<category: #Containers>

	^ self gtkExampleButtonBoxDoing: [ :box | box placeAtEdges ]
]

{ #category : #'private-examples-containers' }
GtkExamples class >> gtkExampleButtonBoxPlaceAtEnd [
	<gtkExample>
	<title: 'ButtonBox place at end'>
	<category: #Containers>

	^ self gtkExampleButtonBoxDoing: [ :box | box placeAtEnd ]
]

{ #category : #'private-examples-containers' }
GtkExamples class >> gtkExampleButtonBoxPlaceAtStart [
	<gtkExample>
	<title: 'ButtonBox place at start'>
	<category: #Containers>

	^ self gtkExampleButtonBoxDoing: [ :box | box placeAtStart ]
]

{ #category : #'private-examples-containers' }
GtkExamples class >> gtkExampleButtonBoxSpreadEvenly [
	<gtkExample>
	<title: 'ButtonBox spread evenly'>
	<category: #Containers>

	^ self gtkExampleButtonBoxDoing: [ :box | box spreadEvenly ]
]

{ #category : #'private-examples-buttons' }
GtkExamples class >> gtkExampleButtonWithNoRelief [
	<gtkExample>
	<title: 'Button with no relief'>
	<category: #Buttons>
	
	| button |
	button := GtkButton newLabel: 'Hello'.
	button setNoRelief.
	button connectClicked: [ button label: button label, ' 今' ].
	^ button
]

{ #category : #'private-examples-buttons' }
GtkExamples class >> gtkExampleButtonWithUnderline [
	<gtkExample>
	<title: 'Button with Underline'>
	<category: #Buttons>
	
	| button |
	button := GtkButton new.
	button useUnderline.
	button label: '_Hello'.
	button connectClicked: [ button label: button label, ' 今' ].
	^ button
]

{ #category : #'private-examples-buttons' }
GtkExamples class >> gtkExampleCheckButton [
	<gtkExample>
	<title: 'Check button'>
	<category: #Buttons>

	^ GtkCheckButton newLabel: 'Hello'
]

{ #category : #'private-examples-entries' }
GtkExamples class >> gtkExampleEntry [
	<gtkExample>
	<title: 'Entry'>
	<category: #Entries>

	| entry |
	entry := GtkEntry new.
	entry text: 'Les élèves français'.
	^ entry
]

{ #category : #'private-examples-entries' }
GtkExamples class >> gtkExampleEntryPassword [
	<gtkExample>
	<title: 'Password'>
	<category: #Entries>

	| entry |
	entry := self gtkExampleEntry.
	entry visibility: false.
	^ entry
]

{ #category : #'private-examples-entries' }
GtkExamples class >> gtkExampleEntryPasswordWithDifferentInvisibleCharacter [
	<gtkExample>
	<title: 'Password with Different Chararcter'>
	<category: #Entries>

	| entry character |
	entry := self gtkExampleEntryPassword.

	character := '今'.
	entry invisibleCharacter: character.
	self assert: character = entry invisibleCharacter.
	^ entry
]

{ #category : #'private-examples-entries' }
GtkExamples class >> gtkExampleEntryPasswordWithProgress [
	<gtkExample>
	<title: 'Entry with Progress'>
	<category: #Entries>

	| entry |
	entry := self gtkExampleEntry.
	entry progress: 0.4.
	^ entry
]

{ #category : #'private-examples-entries' }
GtkExamples class >> gtkExampleEntryWithMaxLength [
	<gtkExample>
	<title: 'Entry with Max Length'>
	<category: #Entries>

	| entry |
	entry := self gtkExampleEntry.
	entry maxLength: entry text size + 4.
	^ entry
]

{ #category : #'private-examples-containers' }
GtkExamples class >> gtkExampleFixed [
	<gtkExample>
	<title: 'Fixed'>
	<category: #Containers>
	
	| container |
	container := GtkFixed new.
	3 timesRepeat: [ | button |
		button := GtkButton newLabel: 'Click me'.
		button connectClicked: [ container moveChild: button to: 50 atRandom@50 atRandom ].
		container putChild: button at: 50 atRandom@50 atRandom].
	^ container
]

{ #category : #'private-examples-containers' }
GtkExamples class >> gtkExampleGrid [
	<gtkExample>
	<title: 'Grid'>
	<category: #Containers>

	| container |
	container := GtkGrid new.
	1 to: 5 do: [ :idx | | button |
		button := GtkButton newLabel: 'Hello ',  idx asString.
		button connectClicked: [ button label: button label, ' 今' ].
		container attach: button at: idx@idx ].
	^ container
]

{ #category : #'private-examples-containers' }
GtkExamples class >> gtkExampleHeaderBar [
	<gtkExample>
	<title: 'Window with HeaderBar'>
	<category: #Containers>
	
	^ (GtkButton newLabel: 'Click to open window')
		connectClicked: [ 
			GtkWindow new 
				autoRelease;
				resize: 500@200;
				titleBar: (GtkHeaderBar new
					title: 'Window with title';
					subtitle: 'and subtitle';
					packStart: (GtkButton newLabel: 'And button');
					yourself);
				center;
				showAll;
				inspect ];
		yourself
]

{ #category : #'private-examples-containers' }
GtkExamples class >> gtkExampleHorizontalBox [
	<gtkExample>
	<title: 'Box Horizontal'>
	<category: #Containers>

	| container |
	container := GtkBox newHorizontal.
	1 to: 5 do: [ :idx | | button |
		button := GtkButton newLabel: 'Hello ',  idx asString.
		button connectClicked: [ button label: button label, ' 今' ].
		container add: button ].
	^ container
]

{ #category : #'private-examples-basic' }
GtkExamples class >> gtkExampleImageFromMorph [
	<gtkExample>

	^ GtkImage newMorph: SimpleSwitchMorph new
]

{ #category : #'private-examples-basic' }
GtkExamples class >> gtkExampleImageFromThemeIcon [
	<gtkExample>

	^ GtkBox newHorizontal
			packStart: (GtkImage newIconForMenuNamed: 'document-save-as');
			packStart: (GtkImage newIconForSmallToolbarNamed: 'document-save-as');
			packStart: (GtkImage newIconForLargeToolbarNamed: 'document-save-as');
			packStart: (GtkImage newIconForButtonNamed: 'document-save-as');
			packStart: (GtkImage newIconForDragAndDropNamed: 'document-save-as');
			packStart: (GtkImage newIconForDialogNamed: 'document-save-as');
			yourself
]

{ #category : #'private-examples-basic' }
GtkExamples class >> gtkExampleInfoBar [
	<gtkExample>

	^ self gtkExampleInfoBarWith: [ :infobar | infobar beInfo ]
]

{ #category : #'private-examples-basic' }
GtkExamples class >> gtkExampleInfoBarDefault [
	<gtkExample>

	^ self gtkExampleInfoBarWith: [ :infobar | "Nothing" ]
]

{ #category : #'private-examples-basic' }
GtkExamples class >> gtkExampleInfoBarError [
	<gtkExample>

	^ self gtkExampleInfoBarWith: [ :infobar | infobar beError ]
]

{ #category : #'private-examples-basic' }
GtkExamples class >> gtkExampleInfoBarQuestion [
	<gtkExample>

	^ self gtkExampleInfoBarWith: [ :infobar | infobar beQuestion ]
]

{ #category : #'private-examples-basic' }
GtkExamples class >> gtkExampleInfoBarWarning [
	<gtkExample>

	^ self gtkExampleInfoBarWith: [ :infobar | infobar beWarning ]
]

{ #category : #'private-examples-basic' }
GtkExamples class >> gtkExampleInfoBarWith: aBlock [

	| bar |
	bar := GtkInfoBar new.
	aBlock value: bar.
	^ bar
		addButtonWithLabel: 'Answer 1' withId: 1;
		addButtonWithLabel: 'Answer 2' withId: 2;
		addButtonWithLabel: 'Answer 3' withId: 3;
		connectResponse: [ :response | self inform: 'Got: ', response asString ];
		yourself
]

{ #category : #'private-examples-basic' }
GtkExamples class >> gtkExampleLabel [
	<gtkExample>

	^ GtkLabel newLabel: 'Hello 今'
]

{ #category : #'private-examples-containers' }
GtkExamples class >> gtkExampleLayout [
	<gtkExample>
	<title: 'Layout'>
	<category: #Containers>
	
	| container |
	container := GtkLayout new.
	1 to: 3 do: [ :idx | | button |
		button := GtkButton newLabel: 'Click me ', idx asString.
		button connectClicked: [ container moveChild: button to: (300 atRandom@200atRandom) ].
		container
			putChild: button at: (300 atRandom@200atRandom);
			yourself ].
	^ container
]

{ #category : #'private-examples-basic' }
GtkExamples class >> gtkExampleLevelBar [
	<gtkExample>

	^ GtkLevelBar new
		value: 0.7;
		yourself
]

{ #category : #'private-examples-buttons' }
GtkExamples class >> gtkExampleLinkButton [
	<gtkExample>
	<title: 'Link Button'>
	<category: #Buttons>

	^ GtkLinkButton newWithUri: 'https://pharo.org' withLabel: 'go to pharo.org'
]

{ #category : #'private-examples-buttons' }
GtkExamples class >> gtkExampleMenuButtonWithMenu [
	<gtkExample>
	<title: 'Menu Button'>
	<category: #Buttons>
	
	| menuButton fileMenu saveMenuItem quitMenuItem |
	menuButton := GtkMenuButton new.
	fileMenu := GtkMenu new.
	
	saveMenuItem := GtkMenuItem newLabel: 'Save'.
	saveMenuItem connectActivate: [ self inform: 'HAHA!' ].
	fileMenu add: saveMenuItem.
	
	quitMenuItem := GtkMenuItem newLabel: 'Quit'.
	quitMenuItem connectActivate: [ self inform: 'No way!' ].
	fileMenu add: quitMenuItem.

	fileMenu showAll.
	menuButton popUp: fileMenu.

	^ menuButton
]

{ #category : #'private-examples-containers' }
GtkExamples class >> gtkExampleNotebook [
	<gtkExample>
	<title: 'Notebook'>
	<category: #Containers>

	^ GtkNotebook new 
			append: ((GtkBox newVerticalSpacing: 5) 
					packStart: (GtkLabel newLabel: 'panel 1');
					packStart: ((GtkButton newLabel: 'test button 1')
						connectClicked: [ self inform: 'Ok!' ];
						yourself);
					yourself) 
				label: (GtkLabel newLabel: 'page 1');
			append: (GtkLabel newLabel: 'panel 2') label: (GtkLabel newLabel: 'page 2');
		yourself
]

{ #category : #'private-examples-basic' }
GtkExamples class >> gtkExampleProgressBar [
	<gtkExample>

	| bar |
	^ GtkBox newVertical
		packStart: (bar := GtkProgressBar new);
		packStart: ((GtkButton newLabel: 'Progress!')
			connectClicked: [ bar pulse ];
			yourself);
		yourself
]

{ #category : #'private-examples-basic' }
GtkExamples class >> gtkExampleProgressBarInverted [
	<gtkExample>

	| bar |
	^ GtkBox newVertical
		packStart: (bar := GtkProgressBar new beInverted; yourself);
		packStart: ((GtkButton newLabel: 'Progress!')
			connectClicked: [ bar pulse ];
			yourself);
		yourself
]

{ #category : #'private-examples-basic' }
GtkExamples class >> gtkExampleProgressBarWithText [
	<gtkExample>

	| bar |
	^ GtkBox newVertical
		packStart: ((bar := GtkProgressBar new)
			showText;
			text: 'Making progress!';
			yourself);
		packStart: ((GtkButton newLabel: 'Progress!')
			connectClicked: [ bar pulse ];
			yourself);
		yourself
]

{ #category : #'private-examples-buttons' }
GtkExamples class >> gtkExampleRadioButton [
	<gtkExample>
	<title: 'Radio Button'>
	<category: #Buttons>

	| button |
	button := GtkRadioButton newLabel: 'Option 1'.
	^ GtkBox newVertical
		packStart: button;
		packStart: (GtkRadioButton buttonNewInSameGroupAs: button withLabel: 'Option 2');
		packStart: (GtkRadioButton buttonNewInSameGroupAs: button withLabel: 'Option 3');
		yourself
]

{ #category : #'private-examples-containers' }
GtkExamples class >> gtkExampleRevealer [
	<gtkExample>
	<title: 'Revealer'>
	<category: #Containers>

	| container rightRevealer leftRevealer |
	container := GtkBox newHorizontal.
	container add: (leftRevealer := GtkRevealer
		newWithChild: ((GtkButton newLabel: 'Hide me')
			connectClicked: [ 
				leftRevealer hideChild.
				rightRevealer revealChild ];
			yourself)).
	container add: (rightRevealer := GtkRevealer
		newWithChild: (GtkBox newHorizontal
			add: ((GtkButton newLabel: 'Slide Down')
				connectClicked: [ 
					leftRevealer
						setSlideDownTransition;
						revealChild.
					rightRevealer hideChild ];
				yourself);
			add: ((GtkButton newLabel: 'Slide Up')
				connectClicked: [ leftRevealer setSlideUpTransition; revealChild.
					rightRevealer hideChild ];
				yourself);
			add: ((GtkButton newLabel: 'Slide Left')
				connectClicked: [ leftRevealer setSlideLeftTransition; revealChild.
					rightRevealer hideChild ];
				yourself);
			add: ((GtkButton newLabel: 'Slide Right')
				connectClicked: [ leftRevealer setSlideRightTransition; revealChild.
					rightRevealer hideChild ];
				yourself);
			add: ((GtkButton newLabel: 'Crossfade')
				connectClicked: [ leftRevealer setCrossfadeTransition; revealChild.
					rightRevealer hideChild ];
				yourself);
			yourself)) revealChild.
	^ container
]

{ #category : #'private-examples-entries' }
GtkExamples class >> gtkExampleScaleHorizontal [
	<gtkExample>
	<title: 'Scale Horizontal'>
	<category: #Entries>

	^ GtkScale newHorizontalMin: 0.0 max: 10.0 step: 1.0
]

{ #category : #'private-examples-entries' }
GtkExamples class >> gtkExampleScaleNotDrawingValue [
	<gtkExample>
	<title: 'Scale no value'>
	<category: #Entries>

	^ self gtkExampleScaleHorizontal
		drawValue: false;
		yourself
]

{ #category : #'private-examples-entries' }
GtkExamples class >> gtkExampleScaleValueAtLeft [
	<gtkExample>
	<title: 'Scale value at left'>
	<category: #Entries>

	^ self gtkExampleScaleHorizontal
		valueAtLeft;
		yourself
]

{ #category : #'private-examples-entries' }
GtkExamples class >> gtkExampleScaleValueAtTop [
	<gtkExample>
	<title: 'Scale value at top'>
	<category: #Entries>

	^ self gtkExampleScaleHorizontal
		valueAtTop;
		yourself
]

{ #category : #'private-examples-entries' }
GtkExamples class >> gtkExampleScaleVertical [
	<gtkExample>
	<title: 'Scale vertical'>
	<category: #Entries>

	^ GtkScale newVerticalMin: 0.0 max: 10.0 step: 1.0
]

{ #category : #'private-examples-entries' }
GtkExamples class >> gtkExampleScaleWithMarks [
	<gtkExample>
	<title: 'Scale with Marks'>
	<category: #Entries>

	| entry |
	entry := self gtkExampleScaleHorizontal.
	entry addMarkAtValue: 2.0 withPosition: GtkPositionType GTK_POS_TOP withText: 'text1'.
	entry addMarkAtValue: 7.5 withPosition: GtkPositionType GTK_POS_BOTTOM.
	^ entry
]

{ #category : #'private-examples-entries' }
GtkExamples class >> gtkExampleSearchBar [
	<gtkExample>
	<title: 'Search Bar'>
	<category: #Entries>

	| entry bar box |
	box := GtkBox newHorizontal
		packStart: (entry := GtkSearchEntry new);
		packStart: (GtkButton newLabel: 'key');
		yourself.

	bar := GtkSearchBar new.
	bar add: box.
	bar connectEntry: entry.

	^ GtkBox newVertical
			packStart: bar;
			packStart: (GtkLabel newLabel: 'Type on this window!');
			yourself
]

{ #category : #'private-examples-entries' }
GtkExamples class >> gtkExampleSearchEntry [
	<gtkExample>
	<title: 'Search Entry'>
	<category: #Entries>

	^ GtkSearchEntry new
]

{ #category : #'private-examples-basic' }
GtkExamples class >> gtkExampleSpinner [
	<gtkExample>

	| spinner toggle |
	^ GtkBox newVertical
		packStart: (spinner := GtkSpinner new);
		packStart: ((toggle := GtkToggleButton newLabel: 'Spin')
			connectToggled: [ 
				toggle isActive
					ifTrue: [ spinner start ]
					ifFalse: [ spinner stop ] ];
			yourself);
		yourself
]

{ #category : #'private-examples-containers' }
GtkExamples class >> gtkExampleStackWithStackSidebar [
	<gtkExample>
	<title: 'Stack with Sidebar'>
	<category: #Containers>

	| stack |
	stack := GtkStack new 
			addChild: ((GtkBox newVerticalSpacing: 5) 
					packStart: (GtkLabel newLabel: 'panel 1');
					packStart: ((GtkButton newLabel: 'test button 1')
						connectClicked: [ self inform: 'Ok!' ];
						yourself);
					yourself) 
			withTitle: 'page 1';
			addChild: (GtkLabel newLabel: 'panel 2') withTitle: 'page 2';
		yourself.
	
	^ GtkBox newHorizontal
		add: (GtkStackSidebar forStack: stack);
		add: stack;
		yourself
]

{ #category : #'private-examples-containers' }
GtkExamples class >> gtkExampleStackWithStackSwitcher [
	<gtkExample>
	<title: 'Stack with Switcher'>
	<category: #Containers>

	| stack |
	stack := GtkStack new 
			addChild: ((GtkBox newVerticalSpacing: 5) 
					packStart: (GtkLabel newLabel: 'panel 1');
					packStart: ((GtkButton newLabel: 'test button 1')
						connectClicked: [ self inform: 'Ok!' ];
						yourself);
					yourself) 
			withTitle: 'page 1';
			addChild: (GtkLabel newLabel: 'panel 2') withTitle: 'page 2';
		yourself.
	
	^ GtkBox newVertical
		add: (GtkStackSwitcher forStack: stack);
		add: stack;
		yourself
]

{ #category : #'private-examples-basic' }
GtkExamples class >> gtkExampleStatusBar [
	<gtkExample>

	| statusBar |
	statusBar := GtkStatusBar new.
	(statusBar contextNamed: 'default')
		pushMessage: 'First message that I cannot see';
		pushMessage: 'les élèves français'.
	^ statusBar
]

{ #category : #'private-examples-buttons' }
GtkExamples class >> gtkExampleSwitch [
	<gtkExample>
	<title: 'Switch'>
	<category: #Buttons>

	^ GtkGrid new
		attach: GtkSwitch new left: 0 top: 0 width: 1 height: 1;
		attach: GtkSwitch new left: 0 top: 1 width: 1 height: 1;
		yourself
]

{ #category : #'private-examples-buttons' }
GtkExamples class >> gtkExampleToggleButton [
	<gtkExample>
	<title: 'Toggle Button'>
	<category: #Buttons>

	^ GtkToggleButton newLabel: 'Hello'
]

{ #category : #'private-examples-buttons' }
GtkExamples class >> gtkExampleToggleButtonWithoutIndicator [
	<gtkExample>
	<title: 'Toggle Button without Indicator'>
	<category: #Buttons>

	^ (GtkToggleButton newLabel: 'Hello')
		doNotDrawIndicator;
		yourself
]

{ #category : #'private-examples-containers' }
GtkExamples class >> gtkExampleVerticalBox [
	<gtkExample>
	<title: 'Box Vertical'>
	<category: #Containers>

	| container |
	container := GtkBox newVertical.
	1 to: 5 do: [ :idx | | button |
		button := GtkButton newLabel: 'Hello ',  idx asString.
		button connectClicked: [ button label: button label, ' 今' ].
		container add: button ].
	^ container
]

{ #category : #'private-examples-buttons' }
GtkExamples class >> gtkExampleVolumeButton [
	<gtkExample>
	<title: 'Volume Button'>
	<category: #Buttons>

	^ GtkVolumeButton new
]

{ #category : #'examples-buttons' }
GtkExamples class >> runExampleFromSender [
	
	GtkApplication ensureRunning.
	(GtkExample on: (self classSide >> ('gtk', thisContext sender selector capitalized) asSymbol)) openInGtkWindow.
]

{ #category : #'see class side' }
GtkExamples >> seeClassSide [
]
