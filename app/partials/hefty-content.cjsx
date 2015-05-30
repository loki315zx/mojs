React  = require 'react'

module.exports = React.createClass
  render:->
    <div className="#{@props.className or ''}">{@props.children}</div>

