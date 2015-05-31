React     = require 'react'
Resizable = require 'react-component-resizable'

module.exports = React.createClass
  
  componentDidMount:-> @_bindWIndowResize(); @_getPosition(); @_loop()
  componentWillUnmount:-> @isStop = true

  getInitialState:-> {}
  _bindWIndowResize:->
    window.addEventListener 'resize', @_getPosition
  _getScrollY:->
    if window.pageYOffset? then window.pageYOffset else document.scrollTop
  _getPosition:->
    console.log 'get position'
    node = @getDOMNode().childNodes[0]; rect = node.getBoundingClientRect()
    scrollY = @_getScrollY(); @wHeight = window.innerHeight
    @top = scrollY + rect.top; @bottom = scrollY + rect.bottom
  _checkVisibility:->
    scrollY = @_getScrollY()
    isShow = if scrollY + @wHeight > @top - 100 and scrollY < @bottom + 100 then true
    else false
    @state.isShow isnt isShow and @setState isShow: isShow
  _loop:->
    return if @isStop; @_checkVisibility()
    requestAnimationFrame(@_loop)

  render:->
    addClass = if !@state.isShow then 'visibility-hidden-g' else ''
    <Resizable className="#{@props.className or ''} #{addClass}" onResize=@_getPosition>
        {@props.children}
    </Resizable>

