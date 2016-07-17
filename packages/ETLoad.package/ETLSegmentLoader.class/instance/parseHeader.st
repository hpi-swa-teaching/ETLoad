parsing
parseHeader
	"Parses a single object header from the current position in the stream."
	| headerSize |

	headerSize := ETLObjectHeader determineHeaderSizeFrom: stream peek.
	^ ETLObjectHeader parseFrom: (stream next: headerSize).
	