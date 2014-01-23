# Asynchronizer [![Build Status](https://travis-ci.org/kevgo/asynchronizer.png?branch=master)](https://travis-ci.org/kevgo/asynchronizer)

A promise that waits for a list of given of conditions to occur.
Optionally collects data from the conditions.

This can be used to collect data from a variety of asynchronous data sources,
and process them all at once when done.


```javascript
// Create a new Asynchronizer, which waits for two specified events.
asynchronizer = new Asynchronizer(['event one', 'event two']);

// Tell the Asynchronizer what to do when all of the events have happened.
asynchronizer.then(function(data) {
  // This method will be fired once the events with name
  // 'event one' and 'event two' have occurred.
  console.log("All done! The collected data is: " + data.join(', '));
});

// Do some things here....

// At some point in your code, event one has happened.
// Tell the Asynchronizer about it.
asynchronizer.check('event one', 'data for event one');

// At this point the Asynchronizer still waits for event two,
// so the callback does not get triggered.

// Do more things here....

// At some other point event two has happened.
// Lets give Asynchronizer the good news.
asynchronizer.check('event two', 'data for event two');

// This is the last event that our Asynchronizer instance was waiting for.
// So this will cause the Asynchronizer to call the callback given to it
// in the "then" method, with the collected data.
// In this example, the console would say:
// "All done! The collected data is: data for event one, data for event two"
```


## Development

* set up development environment: `npm install`
* run the tests: `npm test` or `script/watch_tests` for continuous testing
* compile a new release: `grunt release`
