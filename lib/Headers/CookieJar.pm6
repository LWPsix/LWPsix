class CookieJar is ResponseExaminer is RequestDecorator	{
	has
	has Cookie @!Cookies; 
	has

	method serializePersistentData() {
	}
	
	method serializeAllData() {
	}
	
	method loadData(String $data) { 
	}
	
	method addCookie(:$cookie, :$domain) {
	}
	

}