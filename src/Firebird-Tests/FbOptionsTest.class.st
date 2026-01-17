"
A FbOptionsTest is a test class for testing the behavior of FbOptions
"
Class {
	#name : 'FbOptionsTest',
	#superclass : 'TestCase',
	#category : 'Firebird-Tests',
	#package : 'Firebird-Tests'
}

{ #category : 'tests' }
FbOptionsTest >> testAsUrl [

	| user password host port database role encoding pageSize urlString options |
	user := 'username'.
	password := 'password'.
	host := 'localhost'.
	port := 3050.
	database := 'database.fdb'.
	role := 'admin'.
	encoding := 'UTF8'.
	pageSize := 4096.
	urlString := 'firebird://' , user , ':' , password , '@' , host , ':'
	             , port asString , '/' , database , '?encoding='
	             , encoding , '&role=' , role , '&page-size='
	             , pageSize asString.
	options := FbOptions url: urlString.
	self assert: (urlString asUrl equals: options asUrl)
]

{ #category : 'tests' }
FbOptionsTest >> testUrl [

	| user password host port database role encoding pageSize urlString options |
	user := 'username'.
	password := 'password'.
	host := 'localhost'.
	port := 3050.
	database := 'database.fdb'.
	role := 'admin'.
	encoding := 'UTF8'.
	pageSize := 4096.
	urlString := 'firebird://' , user , ':' , password , '@' , host , ':'
	             , port asString , '/' , database , '?encoding='
	             , encoding , '&role=' , role , '&page-size='
	             , pageSize asString.
	options := FbOptions url: urlString.
	self
		assert: options user equals: user;
		assert: options password equals: password;
		assert: options host equals: host;
		assert: options port equals: port;
		assert: options database equals: database;
		assert: options role equals: role;
		assert: options encoding equals: encoding;
		assert: options pageSize equals: pageSize asString
]
