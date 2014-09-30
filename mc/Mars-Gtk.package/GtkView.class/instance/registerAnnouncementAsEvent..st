event handling
registerAnnouncementAsEvent: anAnnouncementClass
	"Registers an announcements as a platform event if needed. 
	 Non platform widgets should call this method for register events as callbacks (for example,
	 when we need to get a click action). 
	 Not all events from widgets need to have an external representation, so this could end in 
	 nothing, and that would be correct :)"
	anAnnouncementClass registerEvent: self