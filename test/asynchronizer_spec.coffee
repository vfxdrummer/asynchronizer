chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'
expect = chai.expect
Asynchronizer = require '../src/asynchronizer'


describe 'Asynchronizer', ->
  
  beforeEach ->
    @callback = sinon.stub()
    @asynchronizer = new Asynchronizer ['one', 'two', 'three']


  context 'callback defined before the conditions are fulfilled', ->

    beforeEach ->
      @asynchronizer.then @callback

    it 'does not call the done callback if not all conditions are fulfilled', ->
      expect(@callback).to.not.have.been.called
      @asynchronizer.check 'one'
      expect(@callback).to.not.have.been.called
      @asynchronizer.check 'two'
      expect(@callback).to.not.have.been.called

    it 'calls the finished condition only when all conditions are fulfilled', ->
      @asynchronizer.check 'one'
      @asynchronizer.check 'two'
      @asynchronizer.check 'three'
      expect(@callback).to.have.been.calledOnce

    it 'calls the callback with the data provided by the conditions', ->
      @asynchronizer.check 'one', 'data for one'
      @asynchronizer.check 'two'
      @asynchronizer.check 'three', 'data for three'
      expect(@callback).to.have.been.calledWith [ 'data for one',
                                                  'data for three' ]


  context 'callback defined while the conditions are fulfilled', ->

    beforeEach ->
      @asynchronizer.check 'one', 'data for one'
      @asynchronizer.check 'two'
      @asynchronizer.then @callback

    it 'does not call the done callback if not all conditions are fulfilled', ->
      expect(@callback).to.not.have.been.called

    it 'calls the finished condition only when all conditions are fulfilled', ->
      @asynchronizer.check 'three'
      expect(@callback).to.have.been.calledOnce

    it 'calls the callback with the data provided by the conditions', ->
      @asynchronizer.check 'three', 'data for three'
      expect(@callback).to.have.been.calledWith [ 'data for one',
                                                  'data for three' ]


  context 'callback defined after the conditions are fulfilled', ->

    beforeEach ->
      @asynchronizer.check 'one', 'data for one'
      @asynchronizer.check 'two'
      @asynchronizer.check 'three', 'data for three'
      @asynchronizer.then @callback

    it 'calls the callback right away', ->
      expect(@callback).to.have.been.calledOnce

    it 'calls the callback with the data given in the individual callbacks', ->
      expect(@callback).to.have.been.calledWith [ 'data for one',
                                                  'data for three' ]

