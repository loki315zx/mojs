
/* istanbul ignore next */

(function() {
  var StaggerWrapper, Staggler, Timeline, h;

  h = require('./h');

  Timeline = require('./tween/timeline');

  Staggler = (function() {
    function Staggler(options, Module) {
      this.init(options, Module);
    }

    Staggler.prototype._getOptionByMod = function(name, i, store) {
      var props, value;
      props = store[name];
      if (props + '' === '[object NodeList]') {
        props = Array.prototype.slice.call(props, 0);
      }
      value = h.isArray(props) ? props[i % props.length] : props;
      return h.parseIfStagger(value, i);
    };

    Staggler.prototype._getOptionByIndex = function(i, store) {
      var key, options, value;
      options = {};
      for (key in store) {
        value = store[key];
        options[key] = this._getOptionByMod(key, i, store);
      }
      return options;
    };

    Staggler.prototype._getChildQuantity = function(name, store) {
      var quantifier;
      quantifier = store[name];
      if (h.isArray(quantifier)) {
        return quantifier.length;
      } else if (quantifier + '' === '[object NodeList]') {
        return quantifier.length;
      } else if (quantifier instanceof HTMLElement) {
        return 1;
      } else if (typeof quantifier === 'string') {
        return 1;
      }
    };

    Staggler.prototype._createTimeline = function() {
      return this.timeline = new Timeline;
    };

    Staggler.prototype.init = function(options, Module) {
      var count, i, module, option, _i;
      count = this._getChildQuantity('el', options);
      this._createTimeline();
      this.childModules = [];
      for (i = _i = 0; 0 <= count ? _i < count : _i > count; i = 0 <= count ? ++_i : --_i) {
        option = this._getOptionByIndex(i, options);
        option.isRunLess = true;
        module = new Module(option);
        this.childModules.push(module);
        this.timeline.add(module.timeline);
      }
      return this;
    };

    Staggler.prototype.run = function() {
      return this.timeline.start();
    };

    return Staggler;

  })();

  StaggerWrapper = (function() {
    function StaggerWrapper(Module) {
      var M;
      M = Module;
      return function(options) {
        return new Staggler(options, M);
      };
    }

    return StaggerWrapper;

  })();

  module.exports = StaggerWrapper;

}).call(this);
