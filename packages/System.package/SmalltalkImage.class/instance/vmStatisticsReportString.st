vm statistics
vmStatisticsReportString
	"(Workspace new contents: Smalltalk vmStatisticsReportString)
		openLabel: 'VM Statistics'"
	"StringHolderView
		open: (StringHolder new contents: Smalltalk vmStatisticsReportString)
		label: 'VM Statistics'"

	| params oldSpaceEnd youngSpaceEnd memorySize fullGCs fullGCTime incrGCs incrGCTime tenureCount upTime upTime2 fullGCs2 fullGCTime2 incrGCs2 incrGCTime2 tenureCount2 str freeSize youngSize used |
	params := self getVMParameters.
	oldSpaceEnd			:= params at: 1.
	youngSpaceEnd		:= params at: 2.
	memorySize			:= params at: 3.
	fullGCs				:= params at: 7.
	fullGCTime			:= params at: 8.
	incrGCs				:= params at: 9.
	incrGCTime			:= params at: 10.
	tenureCount			:= params at: 11.
	upTime := (params at: 20) ~= 0 "utcMicrosecondClock at startupp in later Spur VMs"
				ifTrue: [Time utcMicrosecondClock - (params at: 20) + 500 // 1000]
				ifFalse: [Time eventMillisecondClock]. "Fall back on old microsecond clock; Good for 47.5 days"

	str := WriteStream on: (String new: 700).
	str	nextPutAll: 'uptime			';
		print: (upTime / 1000 / 60 // 60); nextPut: $h;
		print: (upTime / 1000 / 60 \\ 60) asInteger; nextPut: $m;
		print: (upTime / 1000 \\ 60) asInteger; nextPut: $s; cr.

	str	nextPutAll: 'memory		';
		nextPutAll: memorySize asStringWithCommas; nextPutAll: ' bytes'; cr.
	str	nextPutAll:	'	old			';
		nextPutAll: oldSpaceEnd asStringWithCommas; nextPutAll: ' bytes (';
		print: (oldSpaceEnd / memorySize * 100) maxDecimalPlaces: 1; nextPutAll: '%)'; cr.

	params size >= 54 ifTrue: [ "Spur object memory"
		youngSize := params at: 44.
		str	nextPutAll: '	young		';
			nextPutAll: youngSize asStringWithCommas; nextPutAll: ' bytes (';
			print: youngSize / memorySize * 100 maxDecimalPlaces: 1; nextPutAll: '%)'; cr.
		youngSize := youngSpaceEnd. "used eden"
		freeSize := (params at: 54) + (params at: 44) - youngSize.
		used := youngSize + oldSpaceEnd - freeSize.
		str	nextPutAll: '	used		';
			nextPutAll: used asStringWithCommas; nextPutAll: ' bytes (';
			print: used / memorySize * 100 maxDecimalPlaces: 1; nextPutAll: '%)'; cr.
		str	nextPutAll: '	free		';
			nextPutAll: freeSize asStringWithCommas; nextPutAll: ' bytes (';
			print: freeSize / memorySize * 100 maxDecimalPlaces: 1; nextPutAll: '%)'; cr
	] ifFalse: [ "Earlier VM and V3 object memory"
		str	nextPutAll: '	young		';
			nextPutAll: (youngSpaceEnd - oldSpaceEnd) asStringWithCommas; nextPutAll: ' bytes (';
			print: (youngSpaceEnd - oldSpaceEnd / memorySize * 100) maxDecimalPlaces: 1; nextPutAll: '%)'; cr.
		str	nextPutAll: '	used		';
			nextPutAll: youngSpaceEnd asStringWithCommas; nextPutAll: ' bytes (';
			print: (youngSpaceEnd / memorySize * 100) maxDecimalPlaces: 1; nextPutAll: '%)'; cr.
		str	nextPutAll: '	free		';
			nextPutAll: (memorySize - youngSpaceEnd) asStringWithCommas; nextPutAll: ' bytes (';
			print: (memorySize - youngSpaceEnd / memorySize * 100) maxDecimalPlaces: 1; nextPutAll: '%)'; cr.
	].

	str	nextPutAll: 'GCs			';
		nextPutAll: (fullGCs + incrGCs) asStringWithCommas.
	fullGCs + incrGCs > 0 ifTrue: [
		str
			nextPutAll: ' ('; 
			print: (upTime / (fullGCs + incrGCs)) maxDecimalPlaces: 1; 
			nextPutAll: ' ms between GCs)'
	].
	str cr.
	str	nextPutAll: '	full			';
		nextPutAll: fullGCs asStringWithCommas; nextPutAll: ' totalling '; nextPutAll: fullGCTime asStringWithCommas; nextPutAll: ' ms (';
		print: (fullGCTime / upTime * 100) maxDecimalPlaces: 1;
		nextPutAll: '% uptime)'.
	fullGCs = 0 ifFalse:
		[str	nextPutAll: ', avg '; print: (fullGCTime / fullGCs) maxDecimalPlaces: 1; nextPutAll: ' ms'].
	str	cr.
	str	nextPutAll: '	incr			';
		nextPutAll: incrGCs asStringWithCommas; nextPutAll: ' totalling '; nextPutAll: incrGCTime asStringWithCommas; nextPutAll: ' ms (';
		print: (incrGCTime / upTime * 100) maxDecimalPlaces: 1;
		nextPutAll: '% uptime), avg '; print: (incrGCTime / incrGCs) maxDecimalPlaces: 1; nextPutAll: ' ms'; cr.
	str	nextPutAll: '	tenures		';
		nextPutAll: tenureCount asStringWithCommas.
	tenureCount = 0 ifFalse:
		[str nextPutAll: ' (avg '; print: incrGCs // tenureCount; nextPutAll: ' GCs/tenure)'].
	str	cr.

LastStats ifNil: [LastStats := Array new: 6]
ifNotNil: [
	upTime2 := upTime - (LastStats at: 1).
	fullGCs2 := fullGCs - (LastStats at: 2).
	fullGCTime2 := fullGCTime - (LastStats at: 3).
	incrGCs2 := incrGCs - (LastStats at: 4).
	incrGCTime2 := incrGCTime - (LastStats at: 5).
	tenureCount2 := tenureCount - (LastStats at: 6).

	str	nextPutAll: self textMarkerForShortReport ;
		nextPutAll: (fullGCs2 + incrGCs2) asStringWithCommas.
	fullGCs2 + incrGCs2 > 0 ifTrue: [
		str
			nextPutAll: ' ('; 
			print: upTime2 // (fullGCs2 + incrGCs2); 
			nextPutAll: ' ms between GCs)'.
	].
	str cr.
	str	nextPutAll: '	uptime		'; print: (upTime2 / 1000.0) maxDecimalPlaces: 1; nextPutAll: ' s'; cr.
	str	nextPutAll: '	full			';
		nextPutAll: fullGCs2 asStringWithCommas; nextPutAll: ' totalling '; nextPutAll: fullGCTime2 asStringWithCommas; nextPutAll: ' ms (';
		print: (fullGCTime2 / upTime2 * 100) maxDecimalPlaces: 1;
		nextPutAll: '% uptime)'.
	fullGCs2 = 0 ifFalse:
		[str	nextPutAll: ', avg '; print: (fullGCTime2 / fullGCs2) maxDecimalPlaces: 1; nextPutAll: ' ms'].
	str	cr.
	str	nextPutAll: '	incr			';
		nextPutAll: incrGCs2 asStringWithCommas; nextPutAll: ' totalling '; nextPutAll: incrGCTime2 asStringWithCommas; nextPutAll: ' ms (';
		print: (incrGCTime2 / upTime2 * 100) maxDecimalPlaces: 1;
		nextPutAll: '% uptime), avg '.
	incrGCs2 > 0 ifTrue: [
		 str print: (incrGCTime2 / incrGCs2) maxDecimalPlaces: 1; nextPutAll: ' ms'
	].
	str cr.
	str	nextPutAll: '	tenures		';
		nextPutAll: tenureCount2 asStringWithCommas.
	tenureCount2 = 0 ifFalse:
		[str nextPutAll: ' (avg '; print: incrGCs2 // tenureCount2; nextPutAll: ' GCs/tenure)'].
	str	cr.
].
	LastStats at: 1 put: upTime.
	LastStats at: 2 put: fullGCs.
	LastStats at: 3 put: fullGCTime.
	LastStats at: 4 put: incrGCs.
	LastStats at: 5 put: incrGCTime.
	LastStats at: 6 put: tenureCount.

	^ str contents
