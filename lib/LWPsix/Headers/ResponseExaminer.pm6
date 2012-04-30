use v6;
use LWPsix::Headers::HeaderSet;


role LWPsix::Headers::ResponseExaminer {
	
	method handleResponse(Str :$data) {...};

}
