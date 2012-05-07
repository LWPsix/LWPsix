use v6;
use LWPsix::UserAgent;

my $ua = LWPsix::UserAgent.new; # default useragent with just HttpProtocol
say "No parameters--reverting to default UserAgent settings...";

my $host = prompt "URL: ";

my $response = $ua.request($host);

say "Serializing response...";

my @resp = $response.lines;
my $status;
my $content_type;
my $data;

$status = (@resp[0].words)[1];
say "Status code: $status";

say "Processing response headers...";
my $end_range;

for @resp -> $line {
	# once we hit the empty line, we've got the message body
	last if $line.words.elems == 0; 
	if $line.words[0] ~~ "Content-Type:" {
		$content_type = $line.words[1];
		say "Received $content_type type of content";
	}
		# TODO: serialize headers
		$end_range++;
}

# a ..^ b == a .. b - 1
$data = @resp.[$end_range ..^ @resp.elems].join("\n");
						
my $fh = open("output.html", :w);
unless $fh.defined {
	die "Could not export response from server!";
}

$fh.say($data);
$fh.close;

# TODO: Execute Lynx on output.html
