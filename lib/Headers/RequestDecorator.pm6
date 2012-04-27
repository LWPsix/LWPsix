role RequestDecorator {

	#Returns a HeaderSet: 
	method decorationsForUrl(:@ks, :@vls) {		 #Assuming that this is what we're passed.	
		return HeaderSet.new(fields => @ks, values => @vls);
	}
}