# Code

var statshound = {};

statshound.report = function(eventName) {
  var event = {event: { name: eventName }};
  var request = new XMLHttpRequest();
  request.open("POST", "https://stats-hound-97714.herokuapp.com/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');
  request.send(JSON.stringify(event));
  }

statshound.report("pageview");
