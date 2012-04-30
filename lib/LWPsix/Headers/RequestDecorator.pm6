use v6;
use LWPsix::Headers::HeaderSet;

role LWPsix::Headers::RequestDecorator {

	# Returns a HeaderSet: 
	# Assuming that this is what we are passed
	method decorationsForUrl(:@ks, :@vls) {...};
}
