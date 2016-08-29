rendering
buildToolbarFor: aPresentation
	| toolbar |
	
	toolbar := GtkToolbar new.
	(self toolbarButtonsForPresentation: aPresentation) 
		do: [ :each | toolbar insert: each gtkToolbarButton at: -1 ].
	
	^ toolbar