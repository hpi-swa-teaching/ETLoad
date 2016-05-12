file in/out
exportSegmentFileName: aFileName directory: aDirectory

	| exportChangeSet |

	"An experimental version to fileout a changeSet first so that a project can contain its own classes"

	"Store my project out on the disk as an *exported* ImageSegment.  Put all outPointers in a form that can be resolved in the target image.  Name it <project name>.extSeg.
	Player classes are included automatically."

	exportChangeSet := nil.
	(changeSet notNil and: [changeSet isEmpty not]) ifTrue: [
		(self confirm: 
'Would you like to include all the changes in the change set
as part of this publishing operation?' translated) ifTrue: [
			exportChangeSet := changeSet
		].
	].
	^ self 
		exportSegmentWithChangeSet: exportChangeSet
		fileName: aFileName 
		directory: aDirectory
