use v6;

class KeepaliveHttpsProtocol is KeepaliveHttpProtocol {
	# examiners, decorators, blah blah blah (inherited)
		
	method request() {
		# I think I can copy this directly from HttpProtocol
	}

	method get_connection(...) {
		# Similar to HttpProtocol but default 443... 
	}
	
	# Creates SslConnection & automatically stores certificate, which should be served
	# immediately when cnxn opens.
	method new_connection(...) {
		# TODO	
	}
}
