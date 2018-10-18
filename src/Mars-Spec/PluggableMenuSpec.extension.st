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
	
	^ MenuPresenter new
		addGroup: [ :group |
			self items do: [ :each |
				group addMenuItem: each asMenuItemPresenter ] ]
]
