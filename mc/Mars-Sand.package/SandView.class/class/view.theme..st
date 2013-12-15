instance creation
view: aView theme: aTheme 
	"Creates a new platform view, receiving a general (mars) view and a theme"
	^ self basicNew 
		initializeView: aView theme: aTheme;
		yourself