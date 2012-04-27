use v6;
use URI;


class ConcreteConnection {
	has $sock;
	method new(Str $host, Str $port) { # do we even need to write a new()?
		$sock = IO::Socket::INet.new(:$host, :$port);
		# TODO: bless to return an actual instance of the object
		return self.bless(*, :$sock);
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
		my $recvd = $sock.recv();
		# TODO: Parse response into a Response object
		return Response.new($recvd);
	}

	method kill()
	{
		$sock.close();
	}
}
