React  = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, Link } = Router

PostImage = require '../../partials/post-image'
Cite      = require '../../partials/cite'
ORXLine   = require '../../partials/orx-line'
SocialNetworksAbout = require '../../partials/social-networks-about'
require '../../css/pages/tutorials-page'
require '../../css/blocks/post'

Tutorials = React.createClass render: ()->
  <div className="post">
    
    <div className="post__header"> Getting Started </div>
    <div className="post__description"> This post is about motion path </div>

    <ORXLine className="post__orx-line" />

    <p className="post__paragraph">A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that I never was a greater artist than now.</p>
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

  </div>

module.exports = Tutorials