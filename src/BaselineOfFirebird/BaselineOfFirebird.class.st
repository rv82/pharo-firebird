"
BaselineOfFirebird
"
Class {
	#name : 'BaselineOfFirebird',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFirebird',
	#package : 'BaselineOfFirebird'
}

{ #category : 'baselines' }
BaselineOfFirebird >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Packages"
			spec
				package: 'Firebird';
				package: 'Firebird-Tests' with: [ spec requires: #( 'Firebird' ) ] ]
]
