class UserAgent {
    # TODO: Wouldn't it make more sense for a UserAgent to have one protocol, and the user to make different agents for different protocols?
    my Protocol $.protocols;

    method request(Str url) {
        ...
        # TODO
        # hand off the request to the appropriate Protocol
    }
}
