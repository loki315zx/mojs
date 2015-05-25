React  = require('react/addons')
ReactTransitionGroup = React.addons.TransitionGroup
mojs   = require('mo-js')
 
TransitionGroupChild = React.createClass
  getInitialState:-> { duration: 500 }
  componentWillEnter: (done)->
    node = this.getDOMNode(); tween = new mojs.Tween
    timeline = new mojs.Timeline
      duration:   @state.duration
      onStart:->  node.style['z-index'] = 1
      onComplete: done
      onUpdate:(p)->
        p = mojs.easing.cubic.inout(p)
        transform = "translateX(#{100*(1-p)}%) translateZ(0)"
        mojs.h.setPrefixedStyle(node, 'transform', transform)
    tween.add(timeline); tween.start()
  componentWillLeave: (done)->
    node = this.getDOMNode(); node.style['z-index'] = 0
    setTimeout (done), @state.duration
  render:-> React.Children.only this.props.children
 
TransitionGroup = React.createClass
  _wrapChild:(child)->
    <TransitionGroupChild>
      {child}
    </TransitionGroupChild>
  render:-> <ReactTransitionGroup {...this.props} childFactory={this._wrapChild} />
 
module.exports = TransitionGroup;