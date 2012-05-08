use v6;

class LWPsix::ConcreteConnection {
	has IO::Socket::INET $sock;

	method new(Str $host, Int $port) {
	say "Created new socket for $host on port $port...";
	$sock = IO::Socket::INET.new(:$host);
	self.bless(*);
	}

    method send(Str $req) {
		my $status = $!sock.send($req);
		# TODO: error check on whether socket is alive or not
		if ! $status {
			$status = $!sock.send($req);
		}
		say "Sent $req over socket!";
	}

    method recv() {
		my $recvd = $!sock.recv();
		# TODO: Parse response into a Response object
		return $recvd; #Response.new($recvd);
	}

    method DESTROY() {
		$!sock.close();
	}
}
