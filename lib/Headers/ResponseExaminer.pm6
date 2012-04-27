role ResponseExaminer {

	#What methods do we put in here that will add to CookieJar?
	
	#handleResponse takes in headers, returns headerSet? Note: actually have HeaderSet class. 
	
	method handleResponse(:$data) {
		my @fields;
		my @ftemp;
		my @values;
		my @vtemp;
		
		my @lines = $data.split("\n"); #Split according to newlines
		
		shift(@lines);
		for @lines -> $line {
			my @parts = $line.split(": ");
			
			if +(@parts) == 2 {
				@ftemp = @fields;
				@fields = @(@ftemp, @(@parts[0]));
				
				@vtemp = @values;
				@values = @(@vtemp, @(@parts[1]));
			}
		}
		
		return HeaderSet.new(fields => @fields, values => @values);
	}

}