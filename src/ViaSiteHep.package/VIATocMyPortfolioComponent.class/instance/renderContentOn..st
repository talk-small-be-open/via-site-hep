rendering
renderContentOn: html
	html heading t: 'myPortfolio:title'.

	html div pT: 'myPortfolio:portfolioInfo'.

	self currentPortfolio isEmpty
		ifTrue: [
			html paragraph t: 'myPortfolio:isEmpty']
		ifFalse: [
			self renderModuleExercisesOn: html.
"			html div: [
				html ukAnchorButton
					callback: [self clearPortfolio];
					with: [ 
						html iconRemove; space.
						html sT: 'myPortfolio:removeAll' ]]."
		]