class Cookie {
	
	
	#Initially set each value of the key-value pair to be 0. Users fill in what they need when they create a new cookie.
	has %.kvs =	value 	=> 0,
				domain 	=> 0,
				name	=> 0,
				path	=> 0,
				secure	=> 0,
				expires	=> 0,
				comment	=> 0,
				version	=> 0;

				
	#Create a new cookie, filling in desired values.
	method new(*%pairs) {
		for %pairs.kv -> $k, $v { #For each key-value pair in the argument hash, we can selectively set elements of the cookie.
			%.kvs{$k} = $v;
		}
	}
	
	#Display contents of this cookie.
	method contents() {
		for %.kvs.kv -> $k, $v {
			say "$k.capitalize(): $v\n";
		}
	}
}