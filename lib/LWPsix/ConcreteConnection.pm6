use v6;

class LWPsix::ConcreteConnection { #is Connection {
	has $sock;
	method new(Str $host, Int $port) {
		self.bless(*);
		my $sock = IO::Socket::INET.new(:$host, :$port);
	}

	method send(Str $req)
	{
		my $status = $sock.send($req);
		# TODO: error check on whether socket is alive or not
		if ! $status {
			$status = $sock.send($req);
		}
	}

	method recv()
	{
		my $recvd = $sock.recv();
		# TODO: Parse response into a Response object
		return $recvd; #Response.new($recvd);
	}

	method kill()
	{
		$sock.close();
	}
}

my $con = LWPsix::ConcreteConnection.new("localhost", 1337);
$con.send("hello there!\n");
say $con.recv();

