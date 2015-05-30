React  = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, Link } = Router

{PrismCode} = require 'react-prism'
PostImage   = require '../../partials/post-image'
Cite        = require '../../partials/cite'
ORXLine     = require '../../partials/orx-line'
DisqusComments      = require '../../partials/disqus-comments'
SocialNetworksAbout = require '../../partials/social-networks-about'
require '../../css/pages/tutorials-page'
require '../../css/blocks/post'
require '../../css/blocks/code-sample'

Tutorials = React.createClass
  componentDidMount:->
    dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true
    dsq.src = '//assets.codepen.io/assets/embed/ei.js'
    (document.getElementsByTagName('head')[0] or document.getElementsByTagName('body')[0]).appendChild(dsq)
  render: ()->
    <div className="post">
      
      <div className="post__header"> Getting Started </div>
      <div className="post__description"> This post is about motion path </div>

      <ORXLine className="post__orx-line" />

      <p className="post__paragraph">A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that I never was a greater artist than now.</p>

      <div className="code-sample">
        <div className="code-sample__syntax">
          <pre className="line-numbers">
            <PrismCode className="language-javascript code-sample__code">
              { """var burst = new Burst({
                    shape:   'circle',
                    stroke: [ 'deeppink',
                                 'cyan',
                                 'orange' ],
                    x: '50%',   y: '50%'
                });
                """
              }
            </PrismCode>
          </pre>
        </div>
        <div className="code-sample__pen">
          <p data-height="345" data-theme-id="15571" data-slug-hash="8312611e3618e83d4103390afc2c8bef" data-default-tab="result" data-user="sol0mka" className='codepen'>See the Pen <a href='http://codepen.io/sol0mka/pen/8312611e3618e83d4103390afc2c8bef/'>8312611e3618e83d4103390afc2c8bef</a> by LegoMushroom (<a href='http://codepen.io/sol0mka'>@sol0mka</a>) on <a href='http://codepen.io'>CodePen</a>.</p>
        </div>
      </div>

      <p className="post__paragraph">A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that I never was a greater artist than now.</p>

      <PostImage
        src="https://d13yacurqjgara.cloudfront.net/users/555872/screenshots/2074566/preloader.gif"
        description="Image1: mutual interface"
        title="mutual interface image" />

      <p className="post__paragraph">A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that I never was a greater artist than now.</p>

      <Cite author="Google Inc.">
        A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.
      </Cite>

      <p className="post__paragraph">A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that I never was a greater artist than now.</p>

      <ORXLine className="post__last-orx-line" type="center" />

      <SocialNetworksAbout className="post__social-networks-about" />
      
      <DisqusComments />
    </div>

module.exports = Tutorials