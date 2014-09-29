announcing
when: anAnnouncement do: aBlock 
	self platformView registerAnnouncementAsEvent: anAnnouncement.
	self announcer 
		when: anAnnouncement 
		do: aBlock