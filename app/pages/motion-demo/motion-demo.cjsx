React = require 'react'
require './css/main.styl'

MotionDemoComponent = React.createClass
  getInitialState:-> @state = {}
  render:->
    <div className="motion-demo">
      <div className="motion-demo__header">Quick demo:</div>
      <div  className="motion"
            dangerouslySetInnerHTML={{__html: @state.html }}>
      </div>
    </div>

  componentDidMount:->
    it = @
    require [ './motion-demo.html', './js/main'],
      (MotionDemoHtml, MotionDemo)->
        it.setState html: MotionDemoHtml
        # new MotionDemo

module.exports = MotionDemoComponent