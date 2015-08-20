EasingGraph   = require './easing-graph'
EasingObject  = require './easing-object'

React         = require 'react'
Tappable      = require 'react-tappable'
mojs          = require 'mo-js'

require '../css/partials/easing-object-graph.styl'

module.exports = React.createClass
  getDefaultProps:->
    path:     'M 0,100 L 100, 0'
    duration: 2000
    delay:    1000

  _start:-> @_timeline.start()
  _stop:->  @_timeline.stop()

  render:->
    @_timeline = new mojs.Timeline repeat: 999999999999
    @_easing   = mojs.easing.path @props.path, precompute: 2500, eps: .01

    setTimeout =>
      @_timeline.start()
    , 100

    <div className="easing-object-graph">
      <EasingObject
        timeline  = {@_timeline}
        easing    = {@_easing}
        duration  = {@props.duration}
        onUpdate  = {@props.onUpdate}>
        {@props.children}
      </EasingObject>

      <EasingGraph
        easing    = {@_easing}
        timeline  = {@_timeline}
        label     = {@props.label}
        duration  = {@props.duration}
        delay     = {@props.delay}
        path      = {@props.path}>
      </EasingGraph>

    </div>
