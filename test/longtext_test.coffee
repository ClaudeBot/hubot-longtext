chai = require "chai"
sinon = require "sinon"
chai.use require "sinon-chai"

expect = chai.expect

describe "longtext", ->
    beforeEach ->
        @robot =
            respond: sinon.spy()

        require("../src/longtext")(@robot)

    # TBA