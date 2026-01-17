"
Firebird connection
"
Class {
	#name : 'FbConnection',
	#superclass : 'Object',
	#instVars : [
		'options'
	],
	#category : 'Firebird',
	#package : 'Firebird'
}

{ #category : 'as yet unclassified' }
FbConnection >> attach: options [
]

{ #category : 'as yet unclassified' }
FbConnection >> connect: options [
	"Connect to database"
	self deprecated: 'This method is not necessary and it will be deleted!'
]

{ #category : 'as yet unclassified' }
FbConnection >> detach [
]
