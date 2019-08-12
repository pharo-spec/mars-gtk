"
I add state interpretation aspects to events who contain the ""state"" field.

"
Trait {
	#name : #TGdkEventState,
	#category : #'Mars-Gtk-Base-Events'
}

{ #category : #testing }
TGdkEventState >> hasAltModifier [

	^ self hasMod1
]

{ #category : #testing }
TGdkEventState >> hasAnyModifier [

	^ self state ~= 0
]

{ #category : #testing }
TGdkEventState >> hasButton1Modifier [

	^ self hasModifier: GdkModifierType GDK_BUTTON1_MASK
]

{ #category : #testing }
TGdkEventState >> hasButton2Modifier [

	^ self hasModifier: GdkModifierType GDK_BUTTON2_MASK
]

{ #category : #testing }
TGdkEventState >> hasButton3Modifier [

	^ self hasModifier: GdkModifierType GDK_BUTTON3_MASK
]

{ #category : #testing }
TGdkEventState >> hasButton4Modifier [

	^ self hasModifier: GdkModifierType GDK_BUTTON4_MASK
]

{ #category : #testing }
TGdkEventState >> hasButton5Modifier [

	^ self hasModifier: GdkModifierType GDK_BUTTON5_MASK
]

{ #category : #testing }
TGdkEventState >> hasCommandModifier [
	"by testing, it seems that macOS command is being mapped to mod2"
	
	^ self hasMod2
]

{ #category : #testing }
TGdkEventState >> hasControlModifier [

	^ self hasModifier: GdkModifierType GDK_CONTROL_MASK
]

{ #category : #testing }
TGdkEventState >> hasLockModifier [

	^ self hasModifier: GdkModifierType GDK_LOCK_MASK	
]

{ #category : #testing }
TGdkEventState >> hasMetaModifier [

	^ self hasModifier: GdkModifierType GDK_META_MASK
]

{ #category : #testing }
TGdkEventState >> hasMod1 [

	^ self hasModifier: GdkModifierType GDK_MOD1_MASK
]

{ #category : #testing }
TGdkEventState >> hasMod2 [

	^ self hasModifier: GdkModifierType GDK_MOD2_MASK
]

{ #category : #testing }
TGdkEventState >> hasMod3 [

	^ self hasModifier: GdkModifierType GDK_MOD3_MASK
]

{ #category : #testing }
TGdkEventState >> hasMod4 [

	^ self hasModifier: GdkModifierType GDK_MOD4_MASK
]

{ #category : #testing }
TGdkEventState >> hasMod5 [

	^ self hasModifier: GdkModifierType GDK_MOD5_MASK
]

{ #category : #testing }
TGdkEventState >> hasModifier: aModifier [

	^ (self state & (aModifier value)) = aModifier value
]

{ #category : #testing }
TGdkEventState >> hasShiftModifier [

	^ self hasModifier: GdkModifierType GDK_SHIFT_MASK
]

{ #category : #testing }
TGdkEventState >> hasSuperModifier [

	^ self hasModifier: GdkModifierType GDK_SUPER_MASK
]

{ #category : #compatibility }
TGdkEventState >> modifiers [
	"modifiers are included in the event"

	^ self
]

{ #category : #'accessing structure variables' }
TGdkEventState >> state [

	self shouldBeImplemented
]
