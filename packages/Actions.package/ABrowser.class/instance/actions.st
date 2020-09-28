accessing
actions

	| method value class actions |
	self classIndex = 0
		ifTrue: [^ {}].
	method :=  (AActions actionPragmas at: self classIndex) method.
	class := method methodHome theNonMetaClass.
	value := method valueWithReceiver: class arguments: {}.
	actions := (value isCollection
		ifTrue: [(value select: [:each | self canDisplay: each])]
		ifFalse: [(self canDisplay: value) ifTrue: [{value}]]).
	actions do: [:each | each clazz: class].
	^ actions
			