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
			res.render 'email/new',
				title: 'Shoot an Email'
				
		
		# Confirmation
		@confirmation = (req, res) ->
			res.render 'email/new',
				title: 'Shoot an Email'