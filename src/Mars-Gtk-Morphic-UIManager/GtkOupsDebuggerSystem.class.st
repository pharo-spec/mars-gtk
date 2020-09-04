Class {
	#name : #GtkOupsDebuggerSystem,
	#superclass : #OupsDebuggerSystem,
	#category : #'Mars-Gtk-Morphic-UIManager'
}

{ #category : #'open debugger' }
GtkOupsDebuggerSystem >> openDebuggerOnRequest: aDebugRequest [
	"Prepare the opening of a debugger, and delegate the debugger selection and opening to a strategy"
	<debuggerCompleteToSender>
	| debuggerOpeningStrategy inCallback |

	inCallback := GtkRunLoop current isInCallback.
	inCallback ifTrue: [ 
		aDebugRequest debugSession spawnNewRunLoop.
		GtkRunLoop current callerProcess ifNotNil: [ :callerProcess |
			"force UI process if caller was correct"
			callerProcess = UIManager default uiProcess ifTrue: [
				aDebugRequest debugSession 
					oldUIProcess: callerProcess;
					errorWasInUIProcess: true ] ] ].
	
	self performPreDebugActionsIn: aDebugRequest.
	
	self spawnNewUIProcessIfNecessary: aDebugRequest.
	aDebugRequest debugSession isAboutUIProcess ifTrue: [ 
		aDebugRequest debugSession newUIProcess: UIManager default  uiProcess ].
	
	self ensureExceptionIn: aDebugRequest debugSession.

	"Schedule the debugger opening in a deferred UI message to address redraw problems after opening a debugger e.g. from the testrunner."
	debuggerOpeningStrategy := self debuggerSelectionStrategy.
	self defaultUIManager defer: [ 
		debuggerOpeningStrategy openDebuggerForSession:
			aDebugRequest debugSession ].
	self suspendDebuggedProcess: aDebugRequest.

	aDebugRequest debugSession stopRunLoop
]
