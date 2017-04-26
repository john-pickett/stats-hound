# Stats Hound
## Easily Track Traffic To Your Website

Using Stats Hound is very simple. You'll put the code below into every page on your site that you want to track. Stats Hound will record every event and save it with the name in quotes in the last line. You can <a href="https://stats-hound-97714.herokuapp.com">sign up for an account here</a>.

## Tracking Code
```var statshound = {};

statshound.report = function(eventName) {
  var event = {event: { name: eventName }};
  var request = new XMLHttpRequest();
  request.open("POST", "https://stats-hound-97714.herokuapp.com/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');
  request.send(JSON.stringify(event));
  }

statshound.report("event");
```
## Sample events
```statshound.report("pageview");
statshound.report("new user");
statshound.report("sale");
statshound.report("message");
```
