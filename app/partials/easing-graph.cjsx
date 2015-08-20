React         = require 'react'
Tappable      = require 'react-tappable'
mojs          = require 'mo-js'

require '../css/partials/easing-graph.styl'

module.exports = React.createClass
  getDefaultProps:->
    path:     'M 0,100 L 100, 0'
    duration: 2000
    delay:    1000

  componentDidMount:->
    progressEl = @refs['progress-line'].getDOMNode()
    customEl   = @refs['custom-line'].getDOMNode()
    pointEl    = @refs['point'].getDOMNode()

    progressLabelTop    = @refs['progress-label-top'].getDOMNode()
    progressLabelBottom = @refs['progress-label-bottom'].getDOMNode()

    customLabelTop      = @refs['custom-label-top'].getDOMNode()
    customLabelBottom   = @refs['custom-label-bottom'].getDOMNode()

    easing = mojs.easing.path @props.path, precompute: 2500, eps: .01
    @_tween = new mojs.Tween
      duration:   @props.duration
      delay:      @props.delay
      repeat:     99999
      onUpdate:   (p)->
        easedP = easing(p)

        mojs.h.style progressEl, 'transform', "translateX(#{ 200*p }px) translateZ(0)"
        mojs.h.style customEl,   'transform', "translate(100px, #{ -200 - 200*easedP }px) translateZ(0)"
        mojs.h.style pointEl,    'transform', "translate(#{ 200*p }px, #{ -200*easedP }px) translateZ(0)"
        
        proc   = p.toFixed(2)
        progressLabelTop.innerText    = proc
        progressLabelBottom.innerText = proc

        easedP = easedP.toFixed(2)
        customLabelTop.innerText    = easedP
        customLabelBottom.innerText = easedP

  _run:->  @_tween.run()
  _stop:-> @_tween.stop()

  render:->
    <div className="easing-graph">
      <div className="easing-graph__center">

        <div className="easing-graph__point" ref="point"></div>

        <div ref="progress-line" className="easing-graph__line-wrapper">
          <div className="easing-graph-line">
            <div ref="progress-label-top" className="easing-graph-line__label easing-graph-line__label--top">0.44</div>
            <div ref="progress-label-bottom" className="easing-graph-line__label easing-graph-line__label--bottom">0.44</div>
          </div>
        </div>

        <div ref="custom-line" className="easing-graph__line-wrapper">
          <div className="easing-graph-line easing-graph-line--horizontal">
            <div ref="custom-label-top" className="easing-graph-line__label easing-graph-line__label--top">0.87</div>
            <div ref="custom-label-bottom" className="easing-graph-line__label easing-graph-line__label--bottom">0.87</div>
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
