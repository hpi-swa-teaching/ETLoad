test-support
do: loadingBlock withLoadResultDo: resultBlock
	"Runs loadingBlock to load an image segment and passes the loaded objects to resultBlock."
	
	ETLLoadCallback value: resultBlock during: loadingBlock.