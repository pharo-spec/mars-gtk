private
createLayout
	"By default, we create a VBox panel (but that's just for convenience)"
	^ self 
		gtkBoxNew: GTK_ORIENTATION_VERTICAL 
		spacing: 0