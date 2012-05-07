use v6;
use LWPsix::UserAgent;

my $ua = LWPsix::UserAgent.new; # default useragent with just HttpProtocol
say "No parameters--reverting to default UserAgent settings...";

my $host = prompt "URL: ";

my $resp = $ua.request($host);
						
my $fh = open("output.html", :w);
unless $fh.defined {
	die "Could not export response from server!";
}

$fh.say($resp);
$fh.close;

# TODO: Execute Lynx on output.html
