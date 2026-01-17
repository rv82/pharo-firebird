"
Firebird connection options
"
Class {
	#name : 'FbOptions',
	#superclass : 'Object',
	#instVars : [
		'host',
		'port',
		'user',
		'password',
		'role',
		'pageSize',
		'encoding',
		'database'
	],
	#category : 'Firebird',
	#package : 'Firebird'
}

{ #category : 'accessing' }
FbOptions class >> url: anUrl [

	^ self new url: anUrl
]

{ #category : 'accessing' }
FbOptions >> asUrl [

	| url |
	url := ZnUrl new
		       scheme: #firebird;
		       username: user;
		       password: password;
		       host: host;
		       port: port;
		       yourself.
	url
		addPathSegment: database;
		queryAt: #encoding add: encoding;
		queryAt: 'page-size' add: pageSize.
	role ifNotNil: [ url queryAt: #role add: role ].
	^ url
]

{ #category : 'accessing' }
FbOptions >> database [

	^ database
]

{ #category : 'accessing' }
FbOptions >> database: anObject [

	database := anObject
]

{ #category : 'accessing' }
FbOptions >> encoding [

	^ encoding
]

{ #category : 'accessing' }
FbOptions >> encoding: anObject [

	encoding := anObject
]

{ #category : 'accessing' }
FbOptions >> host [

	^ host
]

{ #category : 'accessing' }
FbOptions >> host: anObject [

	host := anObject
]

{ #category : 'accessing' }
FbOptions >> pageSize [

	^ pageSize
]

{ #category : 'accessing' }
FbOptions >> pageSize: anObject [

	pageSize := anObject
]

{ #category : 'accessing' }
FbOptions >> password [

	^ password
]

{ #category : 'accessing' }
FbOptions >> password: anObject [

	password := anObject
]

{ #category : 'accessing' }
FbOptions >> port [

	^ port
]

{ #category : 'accessing' }
FbOptions >> port: anObject [

	port := anObject
]

{ #category : 'accessing' }
FbOptions >> role [

	^ role
]

{ #category : 'accessing' }
FbOptions >> role: anObject [

	role := anObject
]

{ #category : 'parsing' }
FbOptions >> url: stringOrUrl [
	"Set connection parameters from stringOrUrl according to the format:
	firebird://username:password@localhost:3050/databasename?encoding=UTF8&role=admin&page-size=4096"

	| url |
	url := stringOrUrl asUrl.
	self assert: (#( firebird fbclient fbsql ) includes: url scheme).
	self
		host: url host;
		port: (url portIfAbsent: [ 3050 ]);
		user: url username;
		password: url password;
		database: url firstPathSegment;
		role: (url queryAt: 'role' ifAbsent: nil);
		encoding: (url queryAt: 'encoding' ifAbsent: 'UTF8'); "Or NONE?"
		pageSize: (url queryAt: 'page-size' ifAbsent: 4096)
]

{ #category : 'accessing' }
FbOptions >> user [

	^ user
]

{ #category : 'accessing' }
FbOptions >> user: anObject [

	user := anObject
]
