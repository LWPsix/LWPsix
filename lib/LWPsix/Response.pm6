use v6;

#We're really just assuming HTML message format responses, perhaps rename and move this class?
class LWPsix::Response {
	has $.content_type;
	has $.status;
	has $.data;

	# TODO: new() take in response scalar and serialize it into Response object
	method new(Str $response) {
		#We're assuming HTML responses
        self.bless(*);
		say "Serializing response...";

		my @resp = $response.lines;

		$.status .=  (@resp[0].words)[1];
		say "Status code: $.status";

		say "Processing response headers...";
		my $end_range;

		for @resp -> $line {
			# once we hit the empty line, we've got the message body
			last if $line.words.elems == 0; 
			if $line.words[0] ~~ "Content-Type:" {
				$.content_type .= $line.words[1];
				say "Received $.content_type type of content";
			}

			# TODO: serialize headers

			$end_range++;
		}

		# a ..^ b == a .. b - 1
		$data .= @resp.[$end_range ..^ @resp.elems];
	}

=begin FORMAT
	Format of a response -- tcpipguide.com/free/t_HTTPResponseMessageFormat.htm
	<status-line>
	<general headers>
	<response headers>
	<entity headers>
	<empty line>
	[<message body>]
	[<message-trailers>]


	e.g.

	HTTP/1.1 200 OK									#Status Line
	Date: Thu, 20 May 2004 21:12:58 GMT				#General headers
	Connection: close								
	Server: Apache/1.3.27							#Response headers
	Accept-Ranges: bytes
	Content-Type: text/html							#Entity headers
	Content-Length: 170
	Last-Modified: Tue, 18 May 2004 12:32:56 GMT
													#empty line
	<html>											#Message body
	...
	</html>
=end FORMAT
}
