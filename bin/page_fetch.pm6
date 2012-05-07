use v6;
use LWPsix::UserAgent;

# Demo

# TODO: Verbose messages
my $ua = LWPsix::UserAgent.new; # default useragent with just HttpProtocol
say "No parameters--reverting to default UserAgent settings..."

my $host = prompt "URL: ";
my $port = 80;

my $resp = $ua.request("http://google.com/");
						
my $fh = open("output.html", :w);
unless $fh.defined {
	die "Could not export response from server!"
}

$fh.say($resp);
$fh.close;

# TODO: Execute Lynx on output.html
