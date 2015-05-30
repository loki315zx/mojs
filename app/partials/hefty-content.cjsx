React  = require 'react'

module.exports = React.createClass
  
  componentDidMount:-> @_getPosition(); @_loop()
  componentWillUnmount:-> @isStop = true

  getInitialState:-> {}

  _getPosition:->
    node = @getDOMNode(); rect = node.getBoundingClientRect()
    @top = rect.top; @bottom = rect.bottom; @wHeight = window.innerHeight

  _checkVisibility:->
    scrollY = if window.pageYOffset? then window.pageYOffset else document.scrollTop
    isShow = if scrollY + @wHeight > @top - 100 and scrollY < @bottom + 200 then true
    else false
    @state.isShow isnt isShow and @setState isShow: isShow

  _loop:->
    return if @isStop; @_checkVisibility()
    requestAnimationFrame(@_loop)

  render:->
    addClass = if !@state.isShow then 'visibility-hidden-g' else ''
    <span className="#{@props.className or ''} #{addClass}">{@props.children}</span>

