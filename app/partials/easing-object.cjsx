React         = require 'react'
Tappable      = require 'react-tappable'
mojs          = require 'mo-js'

require '../css/partials/easing-object.styl'

module.exports = React.createClass
  getDefaultProps:->
    easing:   (p)-> p
    duration: 2000
    delay:    1000

  componentDidMount:->
    objEl = @getDOMNode().children[0]
    @_tween = new mojs.Tween
      duration: @props.duration
      delay:    @props.delay
      onUpdate: (p)=>
        easedP = @props.easing(p)
        @props.onUpdate? { objEl, easedP, p }

    @props.timeline?.add @_tween

  _run:->  @_tween.run()
  _stop:-> @_tween.stop()

  render:->
    bg = if @props.background? then @props.background else null
    <div className="easing-object" style={ backgroundColor: bg } >
      { @props.children }
      <div className="easing-object__label">145 deg</div>
    </div>
