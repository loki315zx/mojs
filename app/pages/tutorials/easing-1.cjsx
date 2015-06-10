React  = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, Link } = Router

PostImage     = require '../../partials/post-image'
Cite          = require '../../partials/cite'
ORXLine       = require '../../partials/orx-line'
CodeSample    = require '../../partials/code-sample'
HeftyContent  = require '../../partials/hefty-content'
DisqusComments      = require '../../partials/disqus-comments'
SocialNetworksAbout = require '../../partials/social-networks-about'
require '../../css/pages/tutorials-page'
require '../../css/blocks/post'
# require '../../css/blocks/code-sample'

module.exports = React.createClass
  render: ()->
    <div className="post">
      <div className="post__header">Easing functions / Property curves</div>
      <div className="post__description"> This post is about easing functions and advanced easing curves for full timing control. </div>
      <ORXLine className="post__orx-line" />

      <p>
        Easing plays the crucial role in sense of animation giving to it the right fill and cadence. It is the secret sauce ingredient that makes a good motion delightful. Linear movement trudging unnatural and  sloppy, this fact comes from the physical laws - nothing in our world moves linearly.
      </p>

      <Cite author="Stanislaw Ulam">
        Using a term like nonlinear science is like referring to the 
        bulk of zoology as the study of non-elephant animals.
      </Cite>

      <p>
        Animation with equal interim spacing(read with linear easing) can 
        envoke in our brain nothing then suspicious or rum response. 
        This is why so important to have the full control of the easing functions.
      </p>

      <p>
        Fortunately mo·js has the best set of easing functions of various 
        types in the modern web, that I’m going to present to you in this article. 
        The easing types are:
      </p>
      <ul>
        <li>Common easing functions</li>
        <li>Cubic Bezier Curves</li>
        <li>Spring easing</li>
        <li>Path easing (Animation Curves if you are into AE stuff)</li>
      </ul>

      <p>
        Firstly I will rake you sparingly thru the common easing functions as you 
        probably already familiar with them. Then we will swiftly go thru the cubic 
        bezeir curves and spring easing as they give us a little bit more control over 
        the easing. Lastly we will sort out the paths easing that will give us the 
        terrific power on timing functions!
      </p>

      <h2>Common easing functions</h2>

      <p>The full list is:</p>

      <ul>
        <li>linear</li>
        <li>ease: in/out/inout</li>
        <li>quad: in/out/inout</li>
        <li>cubic: in/out/inout</li>
        <li>quart: in/out/inout</li>
        <li>quint: in/out/inout</li>
        <li>sin: in/out/inout</li>
        <li>expo: in/out/inout</li>
        <li>circ: in/out/inout</li>
        <li>back: in/out/inout</li>
        <li>elastic: in/out/inout</li>
        <li>bounce: in/out/inout</li>
      </ul>

      <p>
        If you have ever used easing functions in other libraries the list 
        should seem familiar for you. You can pass them around to modules as 
        strings with easing's name delimited by . or directly as functions, 
        that are available on mojs.easing object:
      </p>

      <CodeSample pen="8312611e3618e83d4103390afc2c8bef">
        { js: """var tween = new Tween({
                  // using the easing by name
                  easing:   'cubic.in',
                  onUpdate: function (p) {
                      // p is the current progress
                  }
                }).start();
          """
        }
        { cs: """tween = new Tween(
                  # using the easing by name
                  easing:   'cubic.in'
                  onUpdate: (p)->
                      # p is the current progress

                 ).start()
                 \b
              """
        }
      </CodeSample>

      <p> or </p>

      <CodeSample pen="8312611e3618e83d4103390afc2c8bef">
        { js: """var tween = new Tween({
                  // using the easing by passing the function itself
                  easing:   mojs.easing.cubic.inout,
                  onUpdate: function (p) {
                      // p is the current progress
                  }
                }).start();
          """
        }
        { cs: """tween = new Tween(
                  # using the easing by passing the function itself
                  easing:   mojs.easing.cubic.inout
                  onUpdate: (p)->
                      # p is the current progress

                 ).start()
                 \b
              """
        }
      </CodeSample>
      <p> or even</p>
      <CodeSample pen="8312611e3618e83d4103390afc2c8bef">
        { js: """var tween = new Tween({
                  // no easing here
                  onUpdate: function (p) {
                    var easedProgress  = mojs.easing.quad.out(p);
                    el.style.transform = 'translateX(' + 20*easedProgress + 'px)';
                  }
                }).start();
          """
        }
        { es6: """var tween = new Tween({
                  // no easing here
                  onUpdate: function (p) {
                    var easedProgress  = mojs.easing.quad.out(p);
                    el.style.transform = `translateX(${20*easedProgress}px)`;
                  }
                }).start();
          """
        }
        { cs: """tween = new Tween(
                  # no easing here
                  onUpdate: (p)->
                    easedProgress      = mojs.easing.quad.out(p)
                    el.style.transform = \"translateX(\#{20*easedProgress}px)\"
                 ).start()
                 \b
              """
        }
      </CodeSample>


      <ORXLine className="post__last-orx-line" type="center" />
      <SocialNetworksAbout className="post__social-networks-about" />
      <DisqusComments />

    </div>
