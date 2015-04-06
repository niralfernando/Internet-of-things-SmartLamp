//No copyright whatsoever

//Author: Niral Fernando  
//Email: niral.fernando@mgail.com

imp.configure("http.onrequest", [], []);
led <- hardware.pin9;
led.configure(DIGITAL_OUT);

agent.on("led", function (value) 
{
	if (value == "0") led.write(0); // if 0 was passed in, turn led off
	else led.write(1);            // otherwise, turn it on
});

//////dontsleep function keeps the imp microcontroller awake and never lets the imp sleep///// 
function dontsleep() 
{
	imp.wakeup(5,dontsleep);
	server.log("Server Online");
}
dontsleep();

