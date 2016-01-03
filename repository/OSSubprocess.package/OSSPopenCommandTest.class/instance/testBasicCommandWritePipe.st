tests
testBasicCommandWritePipe
	| command | 
	command := OSSPopenCommand new 
					beWrite;
					command: ('cat').
					"I am testing git"
	self shouldnt: [ command run ] raise: Error. 				
	"I am testing a seccond commit"
	command pipeStream 
		nextPutAll: 'this is a test shat should have been printed in Pharo VM stdout';
		flush.
	command closeStreams.
	self assert: command terminationStatus equals: 0.
	
