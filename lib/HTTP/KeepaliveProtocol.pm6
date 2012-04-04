use v6;

class KeepaliveProtocol is HttpProtocol {
	method get_connection(Str $host) returns Connection {
        # TODO
        ...
    }

	method new_connection(Str $host, Str $port) {
        # abstract
        ...
	}
}
