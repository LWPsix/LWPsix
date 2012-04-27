class HeaderSet { #Essentially - a dressed-up hash that makes explicit a set of header fields and their values.

	has %!HeadPairs;
	
	method new(:@fields, :@values) {
	
		for zip(@fields, @values) -> $f, $v {
			%HeadPairs{$f} = $v;
		}
		
	}
	
	method get($field) {
		return %HeadPairs{$f};
	}

}