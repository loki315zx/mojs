React  = require 'react'

Main = React.createClass render: ()->
  <div className="page main-page">
    <div className="motion-lettering"></div>
    <div className="features">
      <div className="feature">
        <div className="feature__image"></div>
        <div className="feature__header">Fast</div>
        <div className="feature__text">Advanced performace optimizations for the sake of  silcky smooth animations.</div>
      </div>
    </div>
  </div>

module.exports = Main