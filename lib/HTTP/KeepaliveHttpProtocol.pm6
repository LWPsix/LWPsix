use v6;
class KeepaliveHttpProtocol is HttpProtocol {
	has $connection;

	method get_connection() {		
		defined($connection) ?? return connection !! new_connection(host, port)
	}

	method new_connection($host, $port) {
		$connection = Connection.new($host, $port);
	}

}
