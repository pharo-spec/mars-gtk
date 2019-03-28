"
FcConfig

holds a complete configuration of the library; there is one default configuration, other can be constructed from XML data structures. All public entry points that need global data can take an optional FcConfig* argument; passing 0 uses the default configuration. FcConfig objects hold two sets of fonts, the first contains those specified by the configuration, the second set holds those added by the application at run-time. Interfaces that need to reference a particular set use one of the FcSetName enumerated values.

https://www.freedesktop.org/software/fontconfig/fontconfig-devel/x31.html
"
Class {
	#name : #FcConfig,
	#superclass : #FcObject,
	#category : #'Mars-Pango-FontConfig'
}

{ #category : #private }
FcConfig class >> create [

	^ self ffiCall: #(FcConfig *FcConfigCreate())
]

{ #category : #'instance creation' }
FcConfig class >> current [

	^ self getCurrent initialize
]

{ #category : #private }
FcConfig class >> getCurrent [

	^ self ffiCall: #(FcConfig *FcConfigGetCurrent(void))
]

{ #category : #'instance creation' }
FcConfig class >> new [ 

	^ self create initialize
]

{ #category : #accessing }
FcConfig >> addDirectory: aFileReference [
	| result |

	aFileReference exists ifFalse: [ 
		self error: ('Directory {1} does not exists.' format: { aFileReference fullName }) ].
	result := self fcAddDir: aFileReference fullName.
	result ifFalse: [ 
		self error: ('I could not add font directory {1}.' format: { FileReference fullName }) ].
]

{ #category : #accessing }
FcConfig >> addFile: aFileReference [
	| result |

	aFileReference exists ifFalse: [ 
		self error: ('File {1} does not exists.' format: { aFileReference fullName }) ].
	result := self fcAddFile: aFileReference fullName.
	result ifFalse: [ 
		self error: ('I could not add font {1}.' format: { FileReference fullName }) ]
]

{ #category : #accessing }
FcConfig >> applicationFonts [

	^ self getFonts: 1
]

{ #category : #accessing }
FcConfig >> buildFonts [

	^ self ffiCall: #(FcBool FcConfigBuildFonts(self))
]

{ #category : #'private primitives' }
FcConfig >> fcAddDir: dir [
	"https://www.freedesktop.org/software/fontconfig/fontconfig-devel/fcconfigappfontadddir.html"

	^ self ffiCall: #(FcBool FcConfigAppFontAddDir(self, const FcChar8 *dir))
]

{ #category : #'private primitives' }
FcConfig >> fcAddFile: file [
	"https://www.freedesktop.org/software/fontconfig/fontconfig-devel/fcconfigappfontaddfile.html"

	^ self ffiCall: #(FcBool FcConfigAppFontAddFile(self, const FcChar8 *file))
]

{ #category : #'private primitives' }
FcConfig >> getFonts: set [

	^ self ffiCall: #(FcFontSet *FcConfigGetFonts(self, FcSetName set))
]

{ #category : #initialization }
FcConfig >> initialize [
	"cancel super to avoid setHandle: call"
]

{ #category : #accessing }
FcConfig >> installInCurrentFontMap [

	PangoFontMap default config: self
]

{ #category : #accessing }
FcConfig >> systemFonts [

	^ self getFonts: 0
]
