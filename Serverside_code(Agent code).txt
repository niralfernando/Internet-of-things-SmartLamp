//No copyright whatsoever

//Author: Niral Fernando  
//Email: niral.fernando@mgail.com

// Log the URLs to turn LED on/off when agent starts
server.log("Turn the LED on by browsing to " + http.agenturl() + "?led=1");
server.log("Turn the LED off by browsing to " + http.agenturl() + "?led=0");
 
// HTTP Request handlers expect two parameters:
// request: the incoming request
// response: the response we send back to whoever made the request
function requestHandler(request, response) 
{
	// Check if the variable led was passed into the query
  	if ("led" in request.query) 
  	{
    	// if it was, send the value of it to the device
    	device.send("led", request.query["led"]);
	}
  	// send a response back to whoever made the request
  	//NOTE:"response" is httprespond type
  	response.send(200, "Niral's impree received the message");
}
 
// your agent code should only ever have ONE http.onrequest call.
http.onrequest(requestHandler);