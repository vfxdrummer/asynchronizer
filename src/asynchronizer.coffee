# Collects data from asynchronous events.

class Asynchronizer

  # conditions: array of simple conditions to wait for.
  # callback: method that is called when all required conditions are met.
  #           Provides the collected data.
  constructor: (conditions, callback) ->

    # The callback to call when all conditions are fulfilled.
    @callback = callback

    # The conditions that still need to be fulfilled before we are done
    # and can call the callback.
    @remaining_conditions = conditions

    # The accumulated values.
    @values = []


  # Registers that the given condition is fulfilled, and collects the given value associated with it.
  check: (condition, value) ->
    @values.push value if value
    @remaining_conditions = _.without @remaining_conditions, condition
    if @remaining_conditions.length is 0
      @callback @values



module.exports = Asynchronizer if module
window.Asynchronizer = Asynchronizer if window?
