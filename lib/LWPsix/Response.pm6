use v6;

class LWPsix::Response {
	has $.content_type;
	has $.status;
	has $.data;

	# TODO: new() take in response scalar and serialize it into Response object
	method new(Str $response) {
        self.bless(*);
=begin PARSING
		my $resp = $response.lines;
		$.status .= parse first line and retrieve 3-digit code
		for loop through rest of $resp
			if "Content-Type", set $.content_type
			if empty line, break
		set $data to whatever is in message body
=end PARSING				
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
