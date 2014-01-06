# Asynchronizer [![Build Status](https://travis-ci.org/kevgo/asynchronizer.png?branch=master)](https://travis-ci.org/kevgo/asynchronizer)

Provides a mechanism to wait for a defined set of events.
Optionally collects data of these events along the way.

```javascript
// Define an asynchronizer.
asynchronizer = new Asynchronizer(['event one', 'event two'], function(data) {
  // This method is fired once the events with name 'event one' and 'event two'
  // have been registered.
  // For this example, the argument 'data' will have the content:
  // ['data for event one', 'data for event two']
  alert("All events have been registered. The collected data is: " + data);
});

// do some things here....

// Register one of the expected events.
// There are still unchecked conditions in this Asynchronizer,
// so this does not trigger the callback.
asynchronizer.check 'event one', 'data for event one'

// do some more things here....

// Register the other expected event.
// This is the last missing event,
// so this will cause the Asynchronizer to call the callback.
asynchronizer.check('event two', 'data for event two');
```


## Development

* set up development environment: `npm install`
* run tests: `npm test` or `script/watch_tests` for continuous testing
