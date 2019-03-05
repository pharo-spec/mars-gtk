"
GtkExampleBrowser new
	autoRelease;
	resize: 500@200;
	center;
	showAll;
	inspect
"
Class {
	#name : #GtkExampleBrowser,
	#superclass : #Object,
	#instVars : [
		'mainContainer',
		'categoryStack',
		'categories'
	],
	#category : #'Mars-Gtk-Examples'
}

{ #category : #accessing }
GtkExampleBrowser class >> show [ 
	<script>
	
	GtkApplication ensureRunning.
	self new show
]

{ #category : #'examples-windows' }
GtkExampleBrowser >> buildCategoryStack [
		
	|  examples |
	examples := GtkExample allFrom: GtkExamples.
	examples do: [ :example |
		(self categoryStackFor: example category) addExample: example ]
]

{ #category : #categories }
GtkExampleBrowser >> categoryStackFor: categoryName [

	^ categories at: categoryName ifAbsentPut: [ 
		| newExampleStack |
		newExampleStack := GtkStack new.
		categoryStack
			addChild: (GtkBox newHorizontal
				packStart: (GtkStackSidebar forStack: newExampleStack);
				packStart: newExampleStack;
				yourself)
			withTitle: categoryName.
		GtkExampleBrowserCategory on: newExampleStack ]
	
]

{ #category : #'examples-windows' }
GtkExampleBrowser >> show [

	mainContainer := GtkBox newHorizontal.
	categoryStack := GtkStack new.
	categories := Dictionary new.
	self buildCategoryStack.
	
	mainContainer
		add: (GtkStackSidebar forStack: categoryStack);
		add: categoryStack.
		
	GtkWindow new
		autoRelease;
		title: 'Gtk Example Browser';
		resize: 500@500;
		add: mainContainer;
		center;
		showAll
]
