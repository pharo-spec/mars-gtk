accessing
addDecoration: aDecoration 
	decorations ifNil: [ decorations := #() ].
	decorations := decorations copyWith: aDecoration.