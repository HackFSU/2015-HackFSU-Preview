###
# Loads module dependencies and configures app.
#
# Author: Trevor Helms
###

# Parse API Keys (HackFSU) - in env
# Parse API Keys (HackFSU-test) - in env


# Module dependencies
Kaiseki = require 'kaiseki'
bodyParser = require 'body-parser'
validator = require 'express-validator'
autoload = require '../lib/autoload'
session = require 'express-session'

# Configuration
module.exports = (app) ->
	# Create a Parse (Kaiseki) object
	app.kaiseki = new Kaiseki process.env.PARSE_APP_ID, process.env.PARSE_REST_KEY
	app.kaiseki.masterKey = process.env.PARSE_MASTER_KEY

	# Load helper functions
	app.locals.helpers = require __dirname + '/../app/helpers'

	# Autoload controllers
	autoload 'app/controllers', app

	# Configure app settings
	env = process.env.NODE_ENV || 'development'
	app.set 'port', process.env.PORT || 5000
	app.set 'views', __dirname + '/../app/views'
	app.set 'view engine', 'jade'
	app.use require('express').static __dirname + '/../public'
	app.use validator()
	app.use bodyParser.json()
	app.use bodyParser.urlencoded {extended: true} 
	

	# Development settings
	if (env == 'development')
		app.locals.pretty = true
		
	#Session settings
	app.use session 
		name: 'connect.sid'
		secret: 'super secret secrety secret' #TODO: make this encoded
		cookie:
			maxAge: 864000		#10 days
		saveUninitialized: false
		resave: false
	app.use (req,res,next) ->
		res.locals.session = req.session;
		next();
		
		
			
