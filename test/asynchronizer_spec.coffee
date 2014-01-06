chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'
expect = chai.expect
global._ = require 'underscore'
Asynchronizer = require '../src/asynchronizer'


describe 'Asynchronizer', ->
  
  beforeEach ->
    @callback = sinon.stub()
    @asynchronizer = new Asynchronizer ['one', 'two', 'three'], @callback


  describe 'check', ->

    context 'not all condidions fulfilled', ->

      beforeEach ->
        @asynchronizer.check 'one'

      it 'does not call the callback', ->
        expect(@callback).to.not.have.been.called


    context 'all conditions fulfilled', ->

      beforeEach ->
        @asynchronizer.check 'one', 'data one'
        @asynchronizer.check 'two'
        @asynchronizer.check 'three', 'data three'

      it 'calls the callback', ->
        expect(@callback).to.have.been.calledOnce

      it 'provides the collected data in the callback', ->
        expect(@callback).to.have.been.calledWith [ 'data one',
                                                    'data three' ]

