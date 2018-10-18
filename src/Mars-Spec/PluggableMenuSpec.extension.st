Extension { #name : #PluggableMenuSpec }

{ #category : #'*Mars-Spec' }
PluggableMenuSpec >> asMenuBarPresenter [
	
	^ MenuBarPresenter new
		addGroup: [ :group |
			self items do: [ :each |
				group addMenuItem: each asMenuItemPresenter ] ]
]

{ #category : #'*Mars-Spec' }
PluggableMenuSpec >> asMenuPresenter [
	| presenter |
	
	presenter := MenuPresenter new.
	(self items groupByRuns: [ :each | each separator = true ]) do: [ :eachGroup |
		presenter addGroup: [ :group |
			eachGroup do: [  :each |
				group addMenuItem: each asMenuItemPresenter ] ] ].
	^ presenter
]
