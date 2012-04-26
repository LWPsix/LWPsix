use v6;
use URI;


class ConcreteConnection {
	has $sock;
	method new(Str $host, Str $port) {
		$sock = IO::Socket::INet.new(:$host, :$port);
		# TODO: bless to return an instance of the object
	}

	method send(Str $req)
	{
		my $status = $sock.send($req);
		# TODO: error check on whether socket is alive or not
		if ! $status
			$status = $sock.send($req);
	}

	method recv()
	{
		# TODO: Examine response for size to recv
		my $recvd = $sock.recv(buffer_size);
		return parse_response($recvd);
	}

# It bothers me that we don't ever call close on sockets and leave it up to the garbage collector to destroy stuff. I'm pretty sure even in a high-level language we should still be making an effort to close the socket...
}
