React  = require 'react'
Router = require 'react-router'
Link   = Router.Link
Icon   = require './icon'
Button = require './button'
require '../css/partials/header.styl'

# <Link to="app" className="header__link">main</Link>
Header = React.createClass
  render:->
    <header className="header">
      <Link to="app" className="header__logo-link">
        <Icon className="header__logo" path="mojs-loop" />
      </Link>
      <div className="header__links">  
        <Link to="tutorials" className="header__link">Tutorials</Link>
        <Link to="app" className="header__link">APIs</Link>
        <Link to="app" className="header__link">Demos</Link>
        <Link to="app" className="header__link">Contribute</Link>
        <Button text="Download" className="button--orange header__link" link="https://github.com/legomushroom/mojs" />
      </div>
    </header>

module.exports = Header