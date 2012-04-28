use v6;
#use NativeCall;
use LWPsix::Response;
use LWPsix::Connection;
#use LWPsix::HTTPS::Certificate;

# Dunno what's wrong here...

class LWPsix::HTTPS::SslConnection is LWPsix::Connection {
	has $.sock;
#	has LWPsix::HTTPS::Certificate $certificate;
#
#	sub encrypt(Str, Str, Int) returns Str is native("cryptofunctions") { * }
#	sub decrypt(Str, Str, Int) returns Str is native("cryptofunctions") { * }
#
#	method new(Str $host, Int $port) {
#		$.sock = IO::Socket::Inet.new($host, $port);
#
#		# server should send certificate immediately...
#		my Str $response = $.sock.recv();
#
#........................................
#		say "just got response: $response ..."
#........................................
#
#		$certificate = LWPsix::HTTPS::Certificate.new($response);
#
#		return self.bless(*, $.sock, $certificate);
#	}
#
#	# prelim ... no error checking etc.
#	method send(Str $req) {
#		my Str $toSend = encrypt($req, $certificate.getKey(), $certificate.getAlg());
#		my $status = 500; // for testing
#		$status = $.sock.send($toSend);
#
#........................................
#		say "req = $req";
#		say "toSend = $toSend";
#		say "status = $status";
#........................................
#	}
#	
#	# prelim
#	method recv() { # returns LWPsix::Response {
#		my Str $recvd = $.sock.recv();
#		my Str $decrypted = decrypt($recvd, $certificate.getKey(), $certificate.getAlg());
#		
#		# return LWPsix::Response.new($decrypted);
#	}
#
#	method kill() {
#		$.sock.close();
#	}
}

