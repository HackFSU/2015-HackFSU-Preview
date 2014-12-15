###
# Specify all routes here.
#
# Author: Trevor
###

module.exports = (app) ->
	# Home Preview Page ##########################################
	app.get '/', app.PreviewController.index
	app.get '/preview', app.PreviewController.index
	# Submit Confirmation
	app.post '/confirmation', app.PreviewController.confirmation
	app.post '/preview/confirmation', app.PreviewController.confirmation
	
	# Page not found (404) #######################################
	# This should always be the LAST route specified
	app.get '*', (req, res) ->
		res.render '404', title: 'Error 404'
