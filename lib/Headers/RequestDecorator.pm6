role LWP::Headers::RequestDecorator {

	#Returns a HeaderSet: 
	method decorationsForUrl(:@ks, :@vls) {		 #Assuming that this is what we're passed.	
		return HeaderSet.new(fields => @ks, values => @vls);
		
		#should the header set return something like, "field", "=value"? easily done, but would it be necessary?
	}
}