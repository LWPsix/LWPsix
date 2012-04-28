use v6;

# Essentially, a dressed-up hash that makes explicit a set of header fields and
# their values.
class LWPsix::Headers::HeaderSet {

	has %!HeadPairs;
	
	method new(:@fields, :@values) {
		my %hp;
		for zip(@fields, @values) -> $f, $v {
			%hp{$f} = $v;
		}
		
		return self.bless(*, %!HeadPairs => %hp);
		
	}
	
	# Retrieve the value associated w/ a header field within the HeaderSet.
	method get($field) {
		return %!HeadPairs{$field};
	}

}
