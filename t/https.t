use v6;
use Test;
use LWPsix::HTTPS::HttpsProtocol;

say "running HTTPS test suite..."
my LWPsix::HTTPS::HttpsProtocol $proto .= new(); # no args for now

