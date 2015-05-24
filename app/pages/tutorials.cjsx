React  = require 'react'
Router = require 'react-router'
Link   = Router.Link

require '../css/pages/tutorials-page'
Tutorials = React.createClass render: ()->
  <div className="page tutorials-page">
    <div className="main-page__content">
      <div className="motion-lettering"></div>
    </div>
  </div>

module.exports = Tutorials