Class {
	#name : #GtkMenuItemAdapter,
	#superclass : #GtkMenuBaseAdapter,
	#category : #'Mars-Spec'
}

{ #category : #'as yet unclassified' }
GtkMenuItemAdapter class >> defaultSpacing [

	^ 5
]

{ #category : #building }
GtkMenuItemAdapter >> addModelTo: gtkWidget [

	self model icon 
		ifNotNil: [
			gtkWidget add: ((GtkBox newHorizontalSpacing: self class defaultSpacing)
				packStart: (GtkImage newForm: (self model icon)) 
					expand: false 
					fill: false 
					padding: 0;
				packStart: ((GtkLabel newLabel: self model name)
					vAlign: GtkAlign GTK_ALIGN_CENTER;
					yourself);
				yourself) ]
		ifNil: [ 	
				gtkWidget label: self model name ].
			
	self model action ifNotNil: [ :actionBlock |
		gtkWidget connectActivate: actionBlock ].
	self model subMenu ifNotNil: [ :menuPresenter |
		gtkWidget submenu: menuPresenter buildWithSpec ]
]

{ #category : #accessing }
GtkMenuItemAdapter >> gtkClass [

	^ GtkMenuItem
]
