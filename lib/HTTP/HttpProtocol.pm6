use v6;

class HttpProtocol is Protocol {
	has Examiner @.examiners;
	has Decorator @.decorators;

	method request(Str $url, $method = 'GET') {
        # TODO
        ...
	}

	method get_connection(Str $host) returns Connection {
        # abstract
        ...
    }
}
