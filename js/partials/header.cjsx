React  = require 'react'
Router = require 'react-router'
Link   = Router.Link

Header = React.createClass
  render:->
    <header>
      <ul>
        <li><Link to="app">main</Link></li>
        <li><Link to="tutorials">tutorials</Link></li>
      </ul>
    </header>

module.exports = Header