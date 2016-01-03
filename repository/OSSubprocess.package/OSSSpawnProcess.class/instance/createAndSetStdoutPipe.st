pipes
createAndSetStdoutPipe
	| pipe | 
	pipe := OSSSystemAccessor current makePipe.
	self posixSpawnFileActionsAddClose: pipe readEndFileDescriptor.
	self posixSpawnFileActionsAddDup2: pipe writeEndFileDescriptor newFileDescritpion: 1.
	self posixSpawnFileActionsAddClose: pipe writeEndFileDescriptor.	
	stdoutPipe := pipe.
	
	

