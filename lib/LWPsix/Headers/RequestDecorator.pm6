use v6;
use LWPsix::Headers::HeaderSet;

role LWPsix::Headers::RequestDecorator {

	# Returns a HeaderSet: 
	# Assuming that this is what we are passed
	method decorationsForUrl(:@ks, :@vls) returns LWPsix::Headers::HeaderSet {
		#return LWPsix::Headers::HeaderSet.new(fields => @ks, values => @vls);
		
		# Should the header set return something like, "field", "=value"? 
		# Easily done, but would it be necessary?
	}
}
