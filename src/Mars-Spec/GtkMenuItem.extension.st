Extension { #name : #GtkMenuItem }

{ #category : #'*Mars-Spec' }
GtkMenuItem >> adaptFromSpec: aMenuItemPresenter [
	
	self label: aMenuItemPresenter name."
	aMenuItemPresenter subMenu ifNotNil: [ :menuPresenter |
		self submenu: menuPresenter buildWithSpec ]"
]
