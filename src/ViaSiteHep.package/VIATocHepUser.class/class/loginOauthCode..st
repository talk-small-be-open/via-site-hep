as yet unclassified
loginOauthCode: aString
	| postData response data apiToken instance |

	"hep username is email address"
	
	postData := {
		'secret'->'tbd'.
		'code'->aString.
	} aD.
	
	response := self postData: postData endpoint: 'token'.
	response := self callMethod: 'POST' data: postData headers: {'Authorization: Bearer ', self oauthId "or secret?"} endpoint: 'token'.
	apiToken := response.

	"Get users data. Needed for validation-ok, email changes, ..."
	data := self getUserData: apiToken.
	
	instance := self fromDictionary: data.
	
	instance apiToken: apiToken.
	
	^ instance