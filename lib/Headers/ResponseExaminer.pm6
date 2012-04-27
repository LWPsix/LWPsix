role LWP::Headers::ResponseExaminer {

	#What methods do we put in here that will add to CookieJar?
	
	#handleResponse takes in headers, returns headerSet? Note: actually have HeaderSet class. 
	
	method handleResponse(:$data) {
		my @fields;
		my @values;
		
		my @lines = $data.split("\n"); #Split according to newlines
		
		shift(@lines);
		for @lines -> $line {
			
			# We can't just split on ":", as timestamps have HH:MM:SS format.
			# With standardized headers from the HTTP response received,
			# this ensures that we get the label and the contents.			
			my @parts = $line.split(": "); 
			
			if +(@parts) == 2 {
				@fields[+(@fields)] = @parts[0];
				
				@values[+(@values)] = @parts[1];
			}
		}
		
		return HeaderSet.new(fields => @fields, values => @values);
	}

}