React       = require 'react'
mojs        = require 'mo-js'
{PrismCode} = require 'react-prism'

require '../css/pages/main-page'

Main = React.createClass
  runBurst:->
    if !@burst?
      @burst = new mojs.Burst
        parent:       document.querySelector('#js-burst-container')
        shape:        'circle'
        stroke:       ['deeppink', 'cyan', 'orange']
        strokeWidth:  2:0
        x: '50%',     y: '50%'
        isRunLess:    true
    @burst.run()
    # console.log 'a'
  render:->
    <div className="page main-page">
      <div className="main-page__content">
        <div className="motion-lettering"></div>
        
        <div className="[ grid grid--gutter-x0 grid--row-gutter-x6 grid--sliced ]">

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
                <div className="feature__text">Simple declarative API for any coding skills level.</div>
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

        <div className="main-page__quick-start code-block">
          <div className="code-block__header">Quick start:</div>
          <div className="code-block__body">
            <PrismCode className="language-markup">
              {'<script src="http://cdn.jsdelivr.net/mojs/0.119.0/mo.min.js"></script>'}
            </PrismCode>
          </div>
          <div className="code-block__footer">
            Also install thru <a href="https://www.npmjs.com/package/mo-js">npm</a>, <a href="http://bower.io/search/?q=mojs">bower</a> or <a href="http://cdn.jsdelivr.net/mojs/latest/mo.min.js">CDN</a>. <a href="#">Build your own bundle</a>.
          </div>
        </div>

        <div className="main-page__api-demo  [ grid grid--sliced grid--gutter-x2 ]">
          <div className="grid-bit grid-bit--8-12">
           
            <div className="code-block">
              <div className="code-block__header">Declarative API demo:</div>
              <div className="code-block__body">
                <pre>
                  <PrismCode className="language-javascript">
                    { """var burst = new Burst({
                          shape:      'circle',
                          stroke:     [ 'deeppink', 'cyan', 'orange' ],
                          x: '50%',   y: '50%'
                      });
                      """
                    }
                  </PrismCode>
                </pre>

              </div>
              <div className="code-block__footer">
                See more <a href="#">tutorials</a> or <a href="#">docs</a>. Inspire at <a href="#">demos</a>.
              </div>
            </div>

          </div>
          <div className="grid-bit grid-bit--4-12">
            
            <div className="code-block">
              <div className="code-block__header">Result(Tap):</div>
              <div className="code-block__body" id="js-burst-container" onClick=@runBurst>
                <pre>
                  <PrismCode className="language-markup">
                    {"""\n\n\n\n\n"""}
                  </PrismCode>
                </pre>
              </div>
            </div>

          </div>
        </div>

      </div>
    </div>

# <pre className="code-block__body">
#   {'<script src="http://cdn.jsdelivr.net/mojs/0.119.0/mo.min.js"></script>'}
# </pre>

module.exports = Main