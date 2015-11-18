chai = require "chai"
sinon = require "sinon"
chai.use require "sinon-chai"

expect = chai.expect

describe "longtext", ->
    beforeEach ->
        @robot =
            responseMiddleware: sinon.spy (context, next, done) =>

        require("../src/longtext")(@robot)

    it "registers a response middleware", ->
        expect(@robot.responseMiddleware).to.have.been.called