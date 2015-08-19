React       = require 'react'
Router      = require 'react-router'
UniteLink   = require '../../partials/unite-link'
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
      <div className="post__header">Easing / Path Easing</div>
      <div className="post__description"> This post is about path easing curves for your precise timing control. </div>
      <ORXLine className="post__orx-line" />

      <p>
        Easing (or timing function) is the secret sauce ingredient that makes a good motion delightful. 
        Linear movement trudging unnatural and sloppy, 
        this filling comes from our physical world experience - nothing moves linearly around us.
      </p>

      <Cite author="Stanislaw Ulam">
        Using a term like nonlinear science is like referring to the 
        bulk of zoology as the study of non-elephant animals.
      </Cite>

      <p>
        Animation with equal interim spacing(read with linear easing) can 
        envoke in our brain nothing than suspicious/rum response. 
        It just feels plastic and unnatural. As a part of self protection, 
        our subconsciuosness suggests us to get rid of unnatural thing as fast we you can.
        By contrast, natural physicaly motion of things that shouldn't act like live
        beings(like cartoony characters or robots) appeal our attention and araise curiosity.
        That's why so important to have the full control of easing functions.
      </p>

      <p>
        Fortunately <span className="highlight">mo· js</span> 
        &nbsp;has the best set of easing functions of various 
        types in the modern web. Besides 
          <UniteLink link="/" isDisabled="true">
            Base Easing Functions
          </UniteLink>, 
          <UniteLink link="/" isDisabled="true">
            Bezier Curves
          </UniteLink> and 
          <UniteLink link="/" isDisabled="true">
            Springs
          </UniteLink> that you can find in other web animation libraries, 
          <span className="highlight">mo· js</span>
          &nbsp;has super precise easing function type - Path Easing.
          Now you can finally draw your timing functions! 
          That's what this tutorial is dedicated to, hang tight!
      </p>

      <h2>First things first</h2>

      <p>
        Consider the example below that was made to illustrate 
        a case when we need precise control over easing function. 
        We will take something really easy and then envolve it gradually. 
        The start point is a simple falling square:
      </p>

      <CodeSample pen="8312611e3618e83d4103390afc2c8bef">
        { js: """var square = document.querySelector('#js-square');
                  new mojs.Tween({
                    onUpdate: function (progress) {
                      square.style.transform = 'translateY(' + 100*progress + 'px)';
                    }
                  }).start();
          """
        }
      </CodeSample>

      <em> <i>Note</i>: There are no vendor prefixes here for the clarity's sake but some browsers still do need them.</em>

      <p>
        We have one sloppy movement here, it doesn’t really look like something falling down at all, so lets add bounce easing:
      </p>

      <CodeSample pen="8312611e3618e83d4103390afc2c8bef">
        { js: """var square = document.querySelector('#js-square');
                  new mojs.Tween({
                    onUpdate: function (progress) {
                      var bounceProgress = mojs.easing.bounce.out(progress);
                      square.style.transform = 'translateY(' + 100*bounceProgress + 'px)';
                    }
                  }).start();
          """
        }
      </CodeSample>

      <p>
        We have added the bounce easing by passing the linear progress 
        thru <span className="highlight">bounce.out</span> function 
        (line 4)
        &nbsp;that is available on 
        <span className="highlight">mojs.easing</span> object - the place where 
        all easing functions, constructors and helpers are stored. 
        The result is pretty obvious - you probably did it thousands times - 
        we have something that kind of looking like falling object with it’s own physics, 
        despite the fact that it is not.
      </p>

      <p>
        If you'll think about it, this bounce easing represents our object's 
        parameters like the material it is made of or it's weight or acceleration it has. 
        Savvy readers starting to grasp the main problem with the easing function we've 
        used here - it is limited to one set of these parameters and we can’t change them 
        effecively - they are hardcoded into this graph:
      </p>

      <PostImage
        src="app/pages/tutorials/i/bouncy-simple-easing.svg"
        description="Fig.1 Common bounce easing graph"
        className="post-image--full-image-width">
      </PostImage>

      <p>
        But what if we eventually want to change the weight of our object so it will 
        have much wider bouncing amplitude range? That’s the point where the 
        <span className="highlight">path easing</span> become irreplaceable. 
        Lets jump to vector graphics editor with this common graph as a bootstrap. 
        Any vector editor will do, I prefer using  Sketch  lately, but any that can 
        produce <span className="highlight">SVG path</span> works. 
        We will amplify the bouncing curves a bit, to add our motion the fill of much more lighter object 
        (or much more bouncy one made of rubber instead of wood for instance).
        Thats what I it look like: (There is <a href="">.svg file</a> I've made for you.)
      </p>

      <PostImage
        src="app/pages/tutorials/i/bouncy-amplified-easing.svg"
        description="Fig.2 Amplified bounce easing graph"
        className="post-image--full-image-width">
      </PostImage>

      <em>
        <i>Note</i>: By default <span className="highlight">mo· js</span> expects you to draw your easing 
        paths in rectangle of 100x100 as you can notice in provided <a href="">.svg file</a>, but 
        you can change that with special option, we will talk about it a bit later 
        in <span className="highlight">Options</span> section of this tutorial.
      </em>

      <p>
        Now we can generate our custom easing function from the SVG path commands, the 
        path's <span className="highlight">d attribute</span> contains.
        For this simply copy the commands and pass it to 
        the <span className="highlight">mojs.easing.path</span> function (line 2):
      </p>

      <CodeSample pen="8312611e3618e83d4103390afc2c8bef">
        { js: """var square = document.querySelector('#js-square'),
                      bouncyEasing = mojs.easing.path('M0,100 C2.45434624,97.8269293 16.3464551,108.82637 36.7536484,1.51862764 C57.1552734,140.170898 73.4575653,0 73.4575634,0.417637977 C84.8740234,87.625 91.391449,0 91.391449,0 C97.2792969,51.6884766 100,0 100,0');

                  new Tween({
                    onUpdate: function (progress) {
                      var bounceProgress = bouncyEasing(progress);
                      square.style.transform = 'translateY(' + 100*bounceProgress + 'px)';
                    }
                  }).start();
          """
        }
      </CodeSample>

      <p> Yay! Our square fills much more bouncy now! </p>
      <p>
        You can image what amount of 
        freedom <span className="highlight">path easing</span> can give you 
        and how comprehensive your easing functions can now be. But it has much more 
        powerfull purposes, keep reading!
      </p>

      <h2>Property curves</h2>

      <p>
        If you are familiar with After Effects workflow and have ever worked 
        with <a href="#">animation curves</a> this idea wont be new for you.
        If you havn't no worries, it is easy but be attentive it will probably
        change the way your are treating your animations!
      </p>

      <p>
        It should start and end at 0,0 - 1,1
      </p>



      <ORXLine className="post__last-orx-line" type="center" />
      <SocialNetworksAbout className="post__social-networks-about" />
      <DisqusComments />

    </div>
