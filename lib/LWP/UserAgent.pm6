class UserAgent {
    my Protocol $.protocols;

    method request(Str url) {
        ...
        # TODO
        # hand off the request to the appropriate Protocol
    }
}
