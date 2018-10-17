Extension { #name : #GtkMenuShell }

{ #category : #'*Mars-Spec' }
GtkMenuShell >> adaptFromSpec: aMenuPresenter [
	
	"each group has items"
	aMenuPresenter menuGroups 
		do: [ :eachGroup | 
			eachGroup menuItems 
				do: [ :each | self add: each buildWithSpec ] ]
		separatedBy: [ "self addSeparator" ]
]
