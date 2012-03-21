class CookieJar does ResponseExaminer does RequestDecorator	{
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