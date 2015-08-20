React         = require 'react'
Tappable      = require 'react-tappable'
mojs          = require 'mo-js'

require '../css/partials/easing-graph.styl'

module.exports = React.createClass
  getDefaultProps:-> path: 'M 0,100 L 100, 0'

  componentDidMount:->
    progressEl = @refs['progress-line'].getDOMNode()
    customEl   = @refs['custom-line'].getDOMNode()

    easing = mojs.easing.path @props.path
    tween = new mojs.Tween
      duration:   2000
      repeat:     99999999
      onUpdate:   (p)->
        mojs.h.style progressEl, 'transform', "translateX(#{200*p}px) translateZ(0)"
        mojs.h.style customEl,   'transform', "translate(100px, #{-200 - 200*easing(p)}px) translateZ(0)"

    tween.run()

  render:->
    <div className="easing-graph">
      <div className="easing-graph__center">

        <div className="easing-graph__point"></div>

        <div ref="progress-line" className="easing-graph__line-wrapper">
          <div className="easing-graph-line">
            <div className="easing-graph-line__label easing-graph-line__label--top">0.44</div>
            <div className="easing-graph-line__label easing-graph-line__label--bottom">0.44</div>
          </div>
        </div>

        <div ref="custom-line" className="easing-graph__line-wrapper">
          <div className="easing-graph-line easing-graph-line--horizontal">
            <div className="easing-graph-line__label easing-graph-line__label--top">0.87</div>
            <div className="easing-graph-line__label easing-graph-line__label--bottom">0.87</div>
          </div>
        </div>

        <div className="easing-graph__small-label easing-graph__small-label--zero">0,0</div>
        <div className="easing-graph__small-label easing-graph__small-label--one">1,1</div>

        <div className="easing-graph__label easing-graph__label--progress">progress</div>
        <div className="easing-graph__custom-label-wrapper">
          <div className="easing-graph__label easing-graph__label--custom">{@props.label}</div>
        </div>

        <div className="easing-graph__graph">
          <svg viewBox="0 0 100 100">
            <path d="#{ @props.path }" strokeLinecap="round" fill="none"></path>
          </svg>
        </div>

      </div>
    </div>
