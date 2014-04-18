accessing
libraryPath
	"(NativeBoost platformId = NativeBoostConstants linux32PlatformId) 
		ifTrue: [ ^ self pathToCairoOnLinux ]."
	(NativeBoost platformId = NativeBoostConstants mac32PlatformId) 
		ifTrue: [ ^ '/opt/local/lib/libgtk-3.dylib' ].
	"(NativeBoost platformId = NativeBoostConstants win32PlatformId) 
		ifTrue: [ ^ 'libcairo-2.dll' ]."
		
	self error: 'define your own path'

