role RequestDecorator {


	method decorationsForUrl(:$quer, :@ks, :@vls) {
	
			#note: @ks should be same size as @vls
			
			
			#$quer = "search" or "s" or whatever indicates a query for the given page
			$quer = $quer ~ "?" #Signify the start of a group of pairs specifying the query
			
			my $size = +(@ks);
			my @pairs = @ks Z @vls; #interleave the (quer)=(val) in an array
			my $ind = 0;
			for @pairs -> $qu, $vl {
			
				$quer = $quer ~ "$qu=$vl"; #Put them together
				if(ind < size) {
					$quer = $quer ~ "&"; #If not at the last pair, we have more to go
				}
				ind = ind + 1;
			}
	}
}