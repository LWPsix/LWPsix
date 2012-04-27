use v6;

class LWP::UserAgent {
    # Wouldn't it make more sense for a UserAgent to have one protocol, and the user to make different agents for different protocols?
    my Protocol %protocols;

    # TODO: new() populates protocols according to parameters

    # TODO: add optional parameter for type of query
    method request(Str url) {
        ...
        # TODO: hand off request to the appropriate Protocol
	# Assume HttpProtocol for now
	
    }
}
