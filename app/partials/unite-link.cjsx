React    = require 'react'
Router   = require 'react-router'
Link     = Router.Link
Button   = require './button'
require '../css/partials/link.styl'
require '../css/partials/button.styl'

module.exports = React.createClass
  render:->
    btnClass = if @props.type is 'button' then 'button' else ''
    classAttr = "link touchable #{@props.className} #{btnClass}"
    if @props.link.match /https?/
      <a href="#{@props.link}" className="#{classAttr}">
        { @props.children }
        <div className="link__underline"></div>
      </a>
    else
      <Link to="#{@props.link}" className="#{classAttr}">
        { @props.children }
        <div className="link__underline"></div>
      </Link>
