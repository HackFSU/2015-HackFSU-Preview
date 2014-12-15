###
# Specify all routes here.
#
# Author: Trevor
###

module.exports = (app) ->
	# Home Preview Page ##########################################
	app.get '/', app.PreviewController.index
	# Submit Confirmation
	app.get '/confirmation', app.PreviewController.index

	# Page not found (404) #######################################
	# This should always be the LAST route specified
	app.get '*', (req, res) ->
		res.render '404', title: 'Error 404'
