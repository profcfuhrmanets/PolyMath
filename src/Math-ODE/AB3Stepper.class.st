"
It is stepper for Adams - Bashforth method of order 3. We can't use AB3 method until we have three old solution values. A AB3 method is explicit.

"
Class {
	#name : #AB3Stepper,
	#superclass : #ExplicitMultiStepper,
	#category : 'Math-ODE'
}

{ #category : #'as yet unclassified' }
AB3Stepper class >> order [
	"AB3 is a third order method."
	^ 3
]

{ #category : #stepping }
AB3Stepper >> doStep: thisState prevState:prevState prevPrevState: prevPrevState prevPrevTime: prevPrevTime [

	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	 ^ self stepSize * (  ( (23/12) * (system state: thisState time:  prevPrevTime+ (2* self stepSize) )) - ((4/3)*(system state: prevState time: prevPrevTime+ self stepSize)) + ((5/12)*(system state: prevPrevState time: prevPrevTime ) )) + thisState.

]

{ #category : #stepping }
AB3Stepper >> doStep: thisState prevState: prevState prevPrevState: prevPrevState prevPrevTime: prevPrevTime  stepSize: timeStep [
	self stepSize: timeStep.
	^ self doStep: thisState prevState: prevState prevPrevState: prevPrevState prevPrevTime: prevPrevTime  .
]

{ #category : #stepping }
AB3Stepper >> lastStep: thisState prevState: prevState prevPrevState: prevPrevState prevPrevTime: prevPrevTime deltaT: incrementOfTime [
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].	
				
	 ^ self stepSize * (  ( (23/12) * (system state: thisState time:  prevPrevTime+ (2* incrementOfTime) )) - ((4/3)*(system state: prevState time: prevPrevTime+ incrementOfTime)) + ((5/12)*(system state: prevPrevState time: prevPrevTime ) )) + thisState.

]

{ #category : #stepping }
AB3Stepper >> lastStep: thisState prevState: prevState prevPrevState: prevPrevState prevPrevTime: prevPrevTime  stepSize: timeStep deltaT: incrementOfTime [
	self stepSize: timeStep.
	^ self lastStep: thisState prevState: prevState prevPrevState: prevPrevState prevPrevTime: prevPrevTime deltaT: incrementOfTime  .
]
