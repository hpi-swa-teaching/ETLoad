constants
assumedCompactClasses
	"Assumed compact classes array for loaded segments.
	
	Because projects don't contain any information about which compact classes were used
	while saving them, we have to assume these (and report errors if they don't seem to
	match).
	
	These classes were adapted from squeakland.org etoys image with
	SystemVersion current being etoys5.0 of 29 March 2012 update 2406 (newest at the
	time of writing). The classes PseudoContext and TranslatedMethod don't exist anymore
	and were therefore removed, but were apparently already deprecated in Squeak 3.
	"
	^  { CompiledMethod . nil . Array . nil .
	       LargePositiveInteger . Float . MethodDictionary . Association .
	       Point . Rectangle . ByteString . nil .
	       BlockContext . MethodContext . nil . Bitmap .
	       nil . nil . nil . nil . nil . nil . nil . nil . nil . nil . nil . nil . nil . nil . nil }.