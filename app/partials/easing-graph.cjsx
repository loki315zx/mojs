React         = require 'react'
Tappable      = require 'react-tappable'
mojs          = require 'mo-js'

require '../css/partials/easing-graph.styl'

module.exports = React.createClass
  getDefaultProps:-> path: 'M 0,100 L 100, 0'

  render:->
    console.log @props.path
    easing = mojs.easing.path @props.path

    <div className="easing-graph">
      <div className="easing-graph__center">
        <div className="easing-graph__label easing-graph__label--progress">progress</div>
        <div className="easing-graph__custom-label-wrapper">
          <div className="easing-graph__label easing-graph__label--custom">{@props.label}</div>
        </div>

        <div className="easing-graph__graph">
          <svg viewBox="0 0 100 100">
            <path d="#{ @props.path }"></path>
          </svg>
        </div>

      </div>
    </div>
