Extension { #name : #SpPresenter }

{ #category : #'*Mars-Gtk' }
SpPresenter >> isActivatable [
	"When being included as part of a *class:SpComponentListPresenter*, presenters can define 
	 whether they are activatable or not (default: ==true==)."

	^ true
]

{ #category : #'*Mars-Gtk' }
SpPresenter >> isSelectable [
	"When being included as part of a *class:SpComponentListPresenter*, presenters can define 
	 whether they are selectable or not (default: ==true==)."

	^ true
]
