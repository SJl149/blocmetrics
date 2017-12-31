# Blocmetrics

#### An analytics service used to track events on the web.

### Features

* A client-side JavaScript snippet that allows a user to track events on their website.
* A server-side API that captures and saves those events to a database.
* A Rails application that displays the captured event data for a user.

## Getting Started

### Prerequisites
This project was created using `rails 4.2.8`.

### Setup Reporting

A JavaScript snippet needs to be added to the application where an event will be recorded.

Add this snippet to the `application.js` file where you want to record the event:
```javascript
var blocmetrics = {};
blocmetrics.report = function(eventName){
    var event = {event: { name: eventName }};
    var request = new XMLHttpRequest();
    request.open("POST", "http://localhost:3000/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
};
```

Call the `report` function to record an event, such as:
```javascript
<a href="/about" onclick="blocmetrics.report('about link clicked')">
```
or
```javascript
<script>blocmetrics.report('about page loaded');</script>
```

**Blocmetrics** rails application will display all the events using charts to understand the data.

## Author

**Scott Lenander** - [SJl149](https://github.com/SJl149)

## Acknowledgements

Special thanks to my mentor, Charlie Gaines [beaugaines](https://github.com/beaugaines), and [Bloc](http://bloc.io).
