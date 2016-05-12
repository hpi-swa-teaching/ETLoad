fileIn/Out
restoreEndianness: endiannessHasToBeFixed
	"If endiannessHasToBeFixed, then fix endianness (byte order) of any objects not already fixed.  Do this by discovering classes that need a startUp message sent to each instance, and sending it..
	I have just been brought in and converted to live objects.  Find all Sets and Dictionaries in the newly created objects and rehash them.  Segment is near then end of memory, since is was newly brought in (and a new object created for it).
	Also, collect all classes of receivers of blocks which refer to instance variables.  Return them.  Caller will check if they have been reshaped."

	| hashedCollections receiverClasses noStartUpNeeded startUps |

	hashedCollections := OrderedCollection new.
	receiverClasses := IdentitySet new.
	noStartUpNeeded := IdentitySet new.	"classes that don't have a per-instance startUp message"
	startUps := IdentityDictionary new.	"class -> MessageSend of a startUp message"
	self allObjectsDo:
		[:object| | cls msg |
		object isInMemory ifTrue:
			[(object isCollection and: [object isKindOf: HashedCollection]) ifTrue:
				[hashedCollections add: object].
			(object isContext and: [object hasInstVarRef]) ifTrue:
				[receiverClasses add: object receiver class]].
			(noStartUpNeeded includes: object class) ifFalse:
				[cls := object class.
				 (msg := startUps at: cls ifAbsent: nil) ifNil:
					[msg := cls startUpFrom: endiannessHasToBeFixed.	"a Message, if we need to swap bytes this time"
					 msg ifNil: [noStartUpNeeded add: cls]
						ifNotNil: [startUps at: cls put: msg]].
				 msg ifNotNil: [msg sentTo: object]]].
	hashedCollections do: [ :each | each compact ]. "our purpose"
	^ receiverClasses	"our secondary job"