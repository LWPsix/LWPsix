use v6;
use NativeCall;
#use URI;

class SslConnection is Connection {
	has Certificate !certificate;	# private

	sub encrypt(Str, Str, int) returns Str is native("cryptofunctions") { * }
	sub decrypt(Str, Str, int) returns Str is native("cryptofunctions") { * }

	method new(Str $host, Str $port) {
		$sock = IO::Socket::Inet.new($host, $port);

		# server should send certificate immediately...
		# TODO: experiment with recv() w/ length arg (LWP::Simple just does recv())
		my $response = $sock.recv();

#........................................
		say "just got response: $response ..."
#........................................

		!certificate = Certificate.new($response);

		return self.bless($sock, !certificate);
	}

	# prelim ... no error checking etc.
	method send(Str $buf) {
		my Str $toSend = encrypt(buf, certificate.getKey(), certificate.getAlg());
		my $status = 500; // for testing
		$ status = $sock.send($toSend);

#........................................
		say "buf = $buf";
		say "toSend = $toSend";
		say "status = $status";
#........................................
	}
	
	# prelim
	method recv() {
		my $recvd = $sock.recv();
		return decrypt($recvd,  certificate.getKey(), certificate.getAlg());	
	}
}

