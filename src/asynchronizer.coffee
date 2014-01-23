_ = require 'underscore' if module?


# Collects data from asynchronous events.
class Asynchronizer

  # conditions: Array of simple conditions to wait for.
  constructor: (conditions) ->

    # The callback to call when all conditions are fulfilled.
    @callback = undefined

    # The conditions that still need to be fulfilled before we are done
    # and can call the callback.
    @remaining_conditions = conditions

    # The accumulated values.
    @values = []


  # Registers that the given condition is fulfilled, and collects the given value associated with it.
  check: (condition, value) ->
    @values.push value if value
    @remaining_conditions = _.without @remaining_conditions, condition
    @_check_and_fire_conditions()


  # Checks the conditions and fires them if this is the time.
  _check_and_fire_conditions: ->
    if @remaining_conditions.length is 0 and @callback
      @callback @values


  # Sets the callback to be called when done.
  then: (callback) ->
    @callback = callback
    @_check_and_fire_conditions()



module?.exports = Asynchronizer
window?.Asynchronizer = Asynchronizer
