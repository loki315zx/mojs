(function() {
  var mojs;

  mojs = {
    revision: '0.119.0',
    isDebug: true,
    helpers: require('./h'),
    Bit: require('./shapes/bit'),
    bitsMap: require('./shapes/bitsMap'),
    Circle: require('./shapes/circle'),
    Cross: require('./shapes/cross'),
    Line: require('./shapes/line'),
    Rect: require('./shapes/rect'),
    Polygon: require('./shapes/polygon'),
    Equal: require('./shapes/equal'),
    Zigzag: require('./shapes/zigzag'),
    Burst: require('./burst'),
    Transit: require('./transit'),
    Swirl: require('./swirl'),
    Stagger: require('./stagger'),
    Spriter: require('./spriter'),
    MotionPath: require('./motion-path'),
    Timeline: require('./tween/timeline'),
    Tween: require('./tween/tween'),
    tweener: require('./tween/tweener'),
    easing: require('./easing')
  };

  mojs.h = mojs.helpers;

  mojs.delta = mojs.h.delta;


  /* istanbul ignore next */

  if ((typeof define === "function") && define.amd) {
    define("mojs", [], function() {
      return mojs;
    });
  }


  /* istanbul ignore next */

  if ((typeof module === "object") && (typeof module.exports === "object")) {
    module.exports = mojs;
  }


  /* istanbul ignore next */

  return typeof window !== "undefined" && window !== null ? window.mojs = mojs : void 0;

}).call(this);
