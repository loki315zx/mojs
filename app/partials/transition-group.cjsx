React  = require('react/addons');
Router = require('react-router');
ReactTransitionGroup = React.addons.TransitionGroup;
mojs     = require('mo-js');
 
TransitionGroupChild = React.createClass
  componentWillEnter: (done)->
    node     = this.getDOMNode()
    tween    = new mojs.Tween
    timeline = new mojs.Timeline
      duration: 300
      onStart:  -> node.style['z-index'] = 1
      onComplete: done
      onUpdate:(p)->
        mojs.h.setPrefixedStyle(node, 'transform', "translateX(#{100*(1-p)}%) translateZ(0)")
    tween.add(timeline); tween.start()
  componentWillLeave: (done)->
    node = this.getDOMNode()
    tween    = new mojs.Tween
    timeline = new mojs.Timeline
      duration:   300
      onComplete: done
      onStart:    ()-> node.style['z-index'] = 0
    tween.add(timeline); tween.start()
  render:-> React.Children.only this.props.children
 
TransitionGroup = React.createClass
  _wrapChild:(child)->
    <TransitionGroupChild>
      {child}
    </TransitionGroupChild>
  render:->
    <ReactTransitionGroup {...this.props} childFactory={this._wrapChild} />
 
module.exports = TransitionGroup;