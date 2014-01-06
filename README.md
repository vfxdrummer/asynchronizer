# Asynchronizer [![Build Status](https://travis-ci.org/kevgo/asynchronizer.js.png?branch=master)](https://travis-ci.org/kevgo/asynchronizer.js)

Provides a mechanism to wait for a defined set of events.
Optionally collects data of these events along the way.

```javascript
// Define an asynchronizer.
asynchronizer = new Asynchronizer(['event one', 'event two'], function(data) {
  alert("All events have been registered. The collected data is: #{data}");
});

// Register event "one".
// There are still unchecked conditions in this Asynchronizer,
// so this does not trigger the callback.
asynchronizer.check 'event one', 'data for event one'

// the next event.
// is the final missing condition,
// this calls the callback with
//data for event one', 'data for event two'].
asynchronizer.check('event two', 'data for event two');
```
