announcing
when: anAnnouncement send: aSelector to: aTarget
	self platformView registerAnnouncementAsEvent: anAnnouncement.
	self announcer 
		when: anAnnouncement 
		send: aSelector 
		to: aTarget