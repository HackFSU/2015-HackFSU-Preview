###
Preview controller
	-background video
	-email submission/confirmation
	-big logo
###


module.exports = (app) ->
	class app.PreviewController
		# Index
		@index = (req, res) ->
			res.render 'preview/index',
				title: ''
				
		
		# Confirmation
		@confirmation = (req, res) ->
			isValidInput = false
			result = false
			if req.body.email?
				isValidInput = true
			
			data =
				email: req.body.email
			
			if isValidInput
				# check parse
				app.kaiseki.createObject "PreviewSubscription", data,
					(error, response, body, success) ->
						# log the result
						msgs = []
						
						if success
							msgs.push("PARSE - PREVIEW SUBSCRIPTION ADDED!")																							
							result = true
						else
							msgs.push("PARSE - PREVIEW SUBSCRIPTION FAILED!")
							
						
						msgs.push("> error: " + JSON.stringify error)
						msgs.push("> body: " + JSON.stringify body)
						for line in msgs 
							console.log(line)
						
						# res.redirect '/users/signin'
						res.render 'preview/confirmation',
							title: 'Email Confirmation'
							pageData:
								result: result
				
			else
				console.log 'Invalid input'
				# res.redirect '/users/signin'
				res.render 'preview/confirmation',
					title: 'Email Confirmation'
					pageData:
						result: result

		

			