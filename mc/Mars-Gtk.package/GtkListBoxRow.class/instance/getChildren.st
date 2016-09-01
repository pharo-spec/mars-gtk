private
getChildren
	"this one is used internally to bring gtk widgets when you cannot directly access to them by API"
	^ self ffiCall: #("GList *" void *gtk_container_get_children (self))