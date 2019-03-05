Class {
	#name : #GtkSmokeTest,
	#superclass : #Object,
	#category : #'Mars-Gtk-Examples'
}

{ #category : #running }
GtkSmokeTest class >> editListCrash [
	"explanation ?"
	<script>
	| window treeView entry items |
	
	GtkApplication ensureRunning.
	
	items :=  #('one' 'two' 'three').
	(window := GtkDialogWindow new)
		autoRelease; 
		title: 'Test';
		resize: 600@400;
		center.
		
	window contentArea
		add: (GtkBox newHorizontal 
			packStart: ((treeView := GtkTreeView new)
				headersVisible: false;
				beSingleSelectionMode;
				appendTextColumn;
				model: (GtkTreeStore newStrings: items);
				yourself);
			packStart: (GtkBox newVertical 
				homogeneous: false;
				packStart: (GtkGrid new
					columnSpacing: 5; 
					attach: (GtkLabel newLabel: 'Add:') at: 1@1;
					attach: (entry := GtkEntry new) at: 2@1;
					yourself);
				packEnd: (GtkActionBar new 
						packEnd: ((GtkButton newLabel: 'Add!')
							alwaysShowImage;
							image: (GtkImage newForm: (self iconNamed: #smallOk));
							connectClicked: [ | selection |
								items := items copyWith: entry text.
								selection := treeView selected.
								treeView model: (GtkTreeStore newStrings: items).
								treeView selectPath: selection.
								entry text: '' ];
							yourself);
						yourself)
					expand: false
					fill: false
					padding: 0;
				yourself);
			yourself).

	[ window run ] fork
]

{ #category : #running }
GtkSmokeTest class >> editListWithTextCrash [
	"explanation ?"
	<script>
	| window treeView entry items |
	
	GtkApplication ensureRunning.
	
	items :=  #('one' 'two' 'three').
	(window := GtkDialogWindow new)
		autoRelease; 
		title: 'Test';
		resize: 600@400;
		center.
		
	window contentArea
		add: (GtkBox newHorizontal 
			packStart: ((treeView := GtkTreeView new)
				headersVisible: false;
				beSingleSelectionMode;
				appendTextColumn;
				model: (GtkTreeStore newStrings: items);
				yourself);
			packStart: (GtkBox newVertical 
				homogeneous: false;
				packStart: (GtkGrid new
					columnSpacing: 5; 
					columnHomogeneous: true;
					attach: (GtkLabel newLabel: 'Add:') at: 1@1;
					attach: (GtkScrolledWindow newWidget: (entry := GtkTextView new)) at: 2@1;
					yourself);
				packEnd: (GtkActionBar new 
						packEnd: ((GtkButton newLabel: 'Add!')
							alwaysShowImage;
							image: (GtkImage newForm: (self iconNamed: #smallOk));
							connectClicked: [ | selection |
								items := items copyWith: entry text.
								selection := treeView selected.
								treeView model: (GtkTreeStore newStrings: items).
								treeView selectPath: selection.
								entry text: '' ];
							yourself);
						yourself)
					expand: false
					fill: false
					padding: 0;
				yourself);
			yourself).

	[ window run ] fork
]

{ #category : #running }
GtkSmokeTest class >> openDialogCrash [
	"This verifies the image is not crashing when trying to open a dialog"
	<script>
	| window |
	
	GtkApplication ensureRunning.
	
	(window := GtkWindow new)
		autoRelease; 
		title: 'Test';
		resize: 600@200;
		center;
		add: (GtkBox newVertical 
			packStart: (GtkLabel newLabel: 'Press test button!');
			packEnd: ((GtkButton newLabel: 'Press me!')
				connectClicked: [ 
					[
						| dialog |
						(dialog := GtkDialogWindow new)
							autoRelease; 
							center;
							title: 'A simple dialog';
							resize: 400@150;
							addButton: 'Close' do: [ dialog respond ];
							run ]
					fork
				];
				yourself);
			yourself).

	window showAll
]
