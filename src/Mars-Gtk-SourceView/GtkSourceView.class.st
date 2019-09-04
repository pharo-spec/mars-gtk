"
GtkSourceView is the main class of the GtkSourceView library. 
Use a GtkSourceBuffer to display text with a GtkSourceView.
This class provides:
- Show the line numbers;
- Show a right margin;
- Highlight the current line;
- Indentation settings;
- Configuration for the Home and End keyboard keys;
- Configure and show line marks;
- And a few other things.

https://developer.gnome.org/gtksourceview/stable/GtkSourceView.html
"
Class {
	#name : #GtkSourceView,
	#superclass : #GtkTextView,
	#category : #'Mars-Gtk-SourceView'
}

{ #category : #example }
GtkSourceView class >> example [

	GtkApplication ensureRunning.
	GtkWindow new
		title: 'Source view example';
		add: (GtkScrolledWindow newWidget: GtkSourceView new);
		showAll
]

{ #category : #example }
GtkSourceView class >> example1 [
	| sourceView |
	
	GtkApplication ensureRunning.
	
	sourceView := GtkSourceView new
		showLineNumbers: true;
		yourself.

	GtkWindow new
		title: 'Source view with line numbers';
		add: (GtkScrolledWindow newWidget: sourceView);
		showAll
]

{ #category : #example }
GtkSourceView class >> example2 [
	| sourceView |
	
	GtkApplication ensureRunning.
	
	sourceView := GtkSourceView new
		showLineNumbers: true;
		highlightCurrentLine: true;
		yourself.

	GtkWindow new
		title: 'Source view highlight current line';
		add: (GtkScrolledWindow newWidget: sourceView);
		showAll
]

{ #category : #example }
GtkSourceView class >> example3 [
	| sourceView |
	
	GtkApplication ensureRunning.
	
	sourceView := GtkSourceView new
		showLineNumbers: true;
		autoIndent: true;
		showRightMargin: true;
		yourself.

	GtkWindow new
		title: 'Source view auto indent';
		add: (GtkScrolledWindow newWidget: sourceView);
		showAll
]

{ #category : #accessing }
GtkSourceView class >> gType [ 

	^ self 
		ffiCall: #(gsize gtk_source_view_get_type())
		module: GtkSourceViewLibrary
]

{ #category : #'instance creation' }
GtkSourceView class >> new [ 

	^ self sourceViewNew initialize
]

{ #category : #private }
GtkSourceView class >> sourceViewNew [

	^ self 
		ffiCall: #(GtkSourceView *gtk_source_view_new ())
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceView >> autoIndent: enable [

	^ self 
		ffiCall: #(void gtk_source_view_set_auto_indent (self, gboolean enable))
		module: GtkSourceViewLibrary
]

{ #category : #private }
GtkSourceView >> getBuffer [

	^ self 
		ffiCall: #(GtkSourceBuffer *gtk_text_view_get_buffer (self))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceView >> highlightCurrentLine: highlight [

	^ self 
		ffiCall: #(void gtk_source_view_set_highlight_current_line (self, gboolean highlight))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceView >> indentOnTab: enable [

	^ self 
		ffiCall: #(void gtk_source_view_set_indent_on_tab (self, gboolean enable))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceView >> insertSpacesInsteadOfTabs: enable [

	^ self 
		ffiCall: #(void gtk_source_view_set_insert_spaces_instead_of_tabs (self, gboolean enable))
		module: GtkSourceViewLibrary
]

{ #category : #testing }
GtkSourceView >> isAutoIndent [

	^ self 
		ffiCall: #(gboolean gtk_source_view_get_auto_indent (self))
		module: GtkSourceViewLibrary
]

{ #category : #testing }
GtkSourceView >> isHighlightCurrentLine [

	^ self 
		ffiCall: #(gboolean gtk_source_view_set_highlight_current_line (self))
		module: GtkSourceViewLibrary
]

{ #category : #testing }
GtkSourceView >> isIndentOnTab [

	^ self 
		ffiCall: #(gboolean gtk_source_view_set_indent_on_tab (self))
		module: GtkSourceViewLibrary
]

{ #category : #testing }
GtkSourceView >> isInsertSpacesInsteadOfTabs [

	^ self 
		ffiCall: #(gboolean gtk_source_view_get_insert_spaces_instead_of_tabs (self))
		module: GtkSourceViewLibrary
]

{ #category : #testing }
GtkSourceView >> isShowLineNumbers [

	^ self 
		ffiCall: #(gboolean gtk_source_view_get_show_line_numbers (self))
		module: GtkSourceViewLibrary
]

{ #category : #testing }
GtkSourceView >> isShowRightMargin [

	^ self 
		ffiCall: #(gboolean gtk_source_view_get_show_right_margin (self))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceView >> showLineNumbers: show [

	^ self 
		ffiCall: #(void gtk_source_view_set_show_line_numbers (self, gboolean show))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceView >> showRightMargin: show [

	^ self 
		ffiCall: #(void gtk_source_view_set_show_right_margin (self, gboolean show))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceView >> tabWidth [

	^ self 
		ffiCall: #(guint gtk_source_view_get_tab_width (self))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceView >> tabWidth: width [

	^ self 
		ffiCall: #(void gtk_source_view_set_tab_width (self, guint width))
		module: GtkSourceViewLibrary
]
