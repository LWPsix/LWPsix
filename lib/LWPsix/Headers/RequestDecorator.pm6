use v6;
use LWPsix::Headers::HeaderSet;

role LWPsix::Headers::RequestDecorator {

	# Returns a HeaderSet: 
	method decorationsForUrl(:@ks, :@vls) {...};
}
