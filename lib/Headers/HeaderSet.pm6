class LWPsix::Headers::HeaderSet { #Essentially - a dressed-up hash that makes explicit a set of header fields and their values.

	has %!HeadPairs;
	
	method new(:@fields, :@values) {
		my %hp;
		for zip(@fields, @values) -> $f, $v {
			%hp{$f} = $v;
		}
		
		self.bless(*, HeadPairs => %hp);
		
	}
	
	method get($field) { #Retrieve the value associated with a header field within the HeaderSet.
		return %HeadPairs{$f};
	}

}