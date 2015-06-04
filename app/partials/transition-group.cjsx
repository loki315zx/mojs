React  = require('react/addons')
ReactTransitionGroup = React.addons.TransitionGroup
mojs   = require('mo-js')
 
TransitionGroupChild = React.createClass
  getInitialState:-> { duration: 400 }
  componentWillEnter: (done)->
    node = @getDOMNode(); tween = new mojs.Tween
    node.style.opacity = 0
    setTimeout =>
      timeline = new mojs.Timeline
        duration:   @state.duration
        onStart:->
          node.style['z-index'] = 1
          node.style.opacity    = 1
        onComplete: done
        onUpdate:(p)=>
          p = mojs.easing.cubic.inout(p)
          transform = "translateX(#{100*(1-p)}%) translateZ(0)"
          mojs.h.setPrefixedStyle(node, 'transform', transform)
          @props.isFade and (node.style.opacity = mojs.easing.cubic.out(p).toFixed(10))
      tween.add(timeline); tween.start()
    , 1

  componentWillLeave: (done)->
    node = this.getDOMNode()
    width = node.offsetWidth
    node.style['width']    = "#{width}px"
    node.style['left']     = "#{node.offsetLeft}px"
    node.style['top']      = 0
    node.style['z-index']  = 0
    node.style['opacity']  = 0
    node.style['position'] = 'absolute'
    if @props.isFade
      setTimeout =>
        tween = new mojs.Tween
        timeline = new mojs.Timeline
          duration:   @state.duration
          onComplete: done
          onUpdate:(p)->
            p = mojs.easing.cubic.inout(p)
            transform = "translateX(#{100*(p)}%) translateZ(0)"
            mojs.h.setPrefixedStyle(node, 'transform', transform)
            node.style.opacity = mojs.easing.expo.in 1-p

        tween.add(timeline); tween.start()
      , 1
    else setTimeout (done), @state.duration
  render:-> React.Children.only this.props.children
 
TransitionGroup = React.createClass
  _wrapChild:(child)->
    <TransitionGroupChild isFade={@props.isFade}>{child}</TransitionGroupChild>
  render:-> <ReactTransitionGroup {...this.props} childFactory={this._wrapChild} />
 
module.exports = TransitionGroup;