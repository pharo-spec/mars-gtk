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
TGdkEventState >> hasModifier: aModifier [

	^ (self state & (aModifier value)) = aModifier value
]

{ #category : #testing }
TGdkEventState >> hasShiftModifier [

	^ self hasModifier: GdkModifierType GDK_SHIFT_MASK
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
