React  = require 'react'
Router = require 'react-router'
Link         = Router.Link
RouteHandler = Router.RouteHandler
Tapable      = require 'react-tappable'
Header       = require './partials/header'
mojs         = require 'mo-js'

require 'sys'
require 'tapjs'
require './css/main.styl'


# document.body.addEventListener 'click', a = ()->
#   document.body.removeEventListener 'click', a
#   console.log 'click', a

App = React.createClass
  onGlobalTap:(e)->
    @reaction ?= new mojs.Transit
      isRunLess: true
    @reaction.run
    console.log e
  render:->
    <Tapable onTap=@onGlobalTap>
      <Header />
      <RouteHandler />
    </Tapable>

module.exports = App