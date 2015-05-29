React  = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, Link } = Router
UniteLink      = require './unite-link'
SocialNetworks = require './social-networks'
ORXLine        = require './orx-line'

require '../css/partials/tutorials-sidebar'
module.exports = React.createClass render: ()->
  <div className="tutorials-sidebar">
    <div className="tutorials-sidebar__content">
      <div className="tutorials-sidebar__section">
        <div className="tutorials-sidebar__header"> Basics </div>
        <UniteLink link="getting-started" className="tutorials-sidebar__link"> Getting Started </UniteLink>
        <UniteLink link="motion-path"     className="tutorials-sidebar__link"> APIs overview   </UniteLink>
        <UniteLink link="/" className="tutorials-sidebar__link"> Transit         </UniteLink>
        <UniteLink link="/" className="tutorials-sidebar__link"> Swirl           </UniteLink>
        <UniteLink link="/" className="tutorials-sidebar__link"> Motion Path     </UniteLink>
      </div>

      <div className="tutorials-sidebar__section">
        <div className="tutorials-sidebar__header"> Tweening </div>
        <UniteLink link="/" className="tutorials-sidebar__link"> Easing          </UniteLink>
        <UniteLink link="/" className="tutorials-sidebar__link"> Timeline        </UniteLink>
        <UniteLink link="/" className="tutorials-sidebar__link"> Tween           </UniteLink>
      </div>

      <div className="tutorials-sidebar__section">
        <div className="tutorials-sidebar__header"> Transforms </div>
        <UniteLink link="/" className="tutorials-sidebar__link"> Goo             </UniteLink>
        <UniteLink link="/" className="tutorials-sidebar__link"> Thunder         </UniteLink>
      </div>

      <div className="tutorials-sidebar__section">
        <div className="tutorials-sidebar__header"> Backgrounds </div>
        <UniteLink link="/" className="tutorials-sidebar__link"> Easing          </UniteLink>
        <UniteLink link="/" className="tutorials-sidebar__link"> Timeline        </UniteLink>
      </div>

      <div className="tutorials-sidebar__section">
        <div className="tutorials-sidebar__header"> Text </div>
        <UniteLink link="/" className="tutorials-sidebar__link"> Easing          </UniteLink>
      </div>

      <ORXLine />

    </div>
    <SocialNetworks className="tutorials-sidebar__social-networks" />
  </div>
