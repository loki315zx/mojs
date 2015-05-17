React  = require 'react'

Main = React.createClass render: ()->
  <div className="page main-page">
    <div className="motion-lettering"></div>
    
    <div className="features [ grid grid--gutter-x0 grid--row-gutter-x6 grid--sliced ]">

      <div className="grid-row">
        <div className="grid-bit grid-bit--4-12">
          <div className="feature feature--fast">
            <div className="feature__image"></div>
            <div className="feature__header">Fast</div>
            <div className="feature__text">Advanced performace optimizations for the sake of  silky smooth animations.</div>
          </div>
        </div>
        <div className="grid-bit grid-bit--4-12">
          <div className="feature feature--retina">
            <div className="feature__image"></div>
            <div className="feature__header">Retina Ready</div>
            <div className="feature__text">Your effects look good at any device, no metter what pixel density it has.</div>
          </div>
        </div>
        <div className="grid-bit grid-bit--4-12">
          <div className="feature feature--simple">
            <div className="feature__image"></div>
            <div className="feature__header">Simple</div>
            <div className="feature__text">Simple declarative API for everybody with any coding skills level.</div>
          </div>
        </div>
      </div>

      <div className="grid-row">
        <div className="grid-bit grid-bit--4-12">
          <div className="feature feature--modular">
            <div className="feature__image"></div>
            <div className="feature__header">Modular</div>
            <div className="feature__text">Build your own bundle and get what is needed only, with no file size overhead.</div>
          </div>
        </div>
        <div className="grid-bit grid-bit--4-12">
          <div className="feature feature--robust">
            <div className="feature__image"></div>
            <div className="feature__header">Robust</div>
            <div className="feature__text">1000+ unit tests and ci techniques help us to build the tool you can rely on.</div>
          </div>
        </div>
        <div className="grid-bit grid-bit--4-12">
          <div className="feature feature--open-sourced">
            <div className="feature__image"></div>
            <div className="feature__header">Open Sourced</div>
            <div className="feature__text">Growing community allows to evolve fast and ship frequently.</div>
          </div>
        </div>
      </div>

    </div>
  </div>

module.exports = Main