###
	Submitting the email to parse
	
	Dependancies:
		Parse Javascript API
		JQuery
	ID's
		'previewEmailSubscribe'
	Notes
		This must be compiled to .js (alt+shift+c)
###

# NOTE: These are for HackFSU-test
PARSE_APP_ID = 'jeoeVa2Nz3VLmrnWpAknbWKZADXHbmQltPSlU8mX'
PARSE_JAVASCRIPT_KEY = 'JoQ24unwktkQMuMvfOjH5KmZCfGswRDPbEiKa7Vz'

#Email class name = 'PreviewSubscription'

parseInitialized = false

submitEmail = (email) ->
	#change button to loading gif
	console.log 'Submitting...'
	
	#make sure parse is connected
	if !parseInitialized
		Parse.initialize PARSE_APP_ID, PARSE_JAVASCRIPT_KEY
		parseInitialized = true
	
	#create new object
	PreviewSubscription = Parse.Object.extend 'PreviewSubscription'
	prevSub = new PreviewSubscription()
	prevSub.set 'email', email
	
	#save the object + handle result
	prevSub.save null, 
		success: (gameScore) ->
			# success
			alert "Saved Email \'" + email + "\'" #TODO make better
			console.log 'Save Successful'
		,	
		failure: (gameScore, error) ->
			# failure
			alert "Oops! There was an error submitting your email. Refresh the page and try again."
			console.log 'Save Failed. Error: ' + error
		
$('#previewEmailSubscribe').submit (event)->
	$email = $('#previewEmailSubscribe input[name=email]').val()
	
	#run check for valid email Input (super basic bc idgaf)	
	if $email.indexOf('@') > -1
		isValidEmailInput = true	
		submitEmail $email
	else 
		alert 'Please enter a valid email.'
		
	event.preventDefault()
	
	