(function() {
  var Tween, easingModule, h, t;

  easingModule = require('../easing');

  h = require('../h');

  t = require('./tweener');

  Tween = (function() {
    Tween.prototype.defaults = {
      duration: 600,
      delay: 0,
      repeat: 0,
      yoyo: false,
      easing: 'Linear.None',
      onStart: null,
      onComplete: null,
      isChained: false
    };

    function Tween(o) {
      this.o = o != null ? o : {};
      this.extendDefaults();
      this.vars();
      this;
    }

    Tween.prototype.vars = function() {
      this.h = h;
      this.props = {};
      this.progress = 0;
      this.prevTime = 0;
      this.props.easing = this.parseEasing(this.o.easing);
      return this.calcDimentions();
    };

    Tween.prototype.calcDimentions = function() {
      this.props.totalTime = (this.o.repeat + 1) * (this.o.duration + this.o.delay);
      return this.props.totalDuration = this.props.totalTime - this.o.delay;
    };

    Tween.prototype.extendDefaults = function() {
      h.extend(this.o, this.defaults);
      return this.onUpdate = this.o.onUpdate;
    };

    Tween.prototype.start = function(time) {
      this.isCompleted = false;
      this.isStarted = false;
      this.props.startTime = (time != null ? time : performance.now()) + this.o.delay;
      this.props.endTime = this.props.startTime + this.props.totalDuration;
      return this;
    };

    Tween.prototype.update = function(time) {
      var cnt, elapsed, isDuration, start, _ref, _ref1, _ref2, _ref3, _ref4, _ref5;
      if ((time >= this.props.startTime) && (time < this.props.endTime)) {
        this.isOnReverseComplete = false;
        this.isCompleted = false;
        if (!this.isFirstUpdate) {
          if ((_ref = this.o.onFirstUpdate) != null) {
            _ref.apply(this);
          }
          this.isFirstUpdate = true;
        }
        if (!this.isStarted) {
          if ((_ref1 = this.o.onStart) != null) {
            _ref1.apply(this);
          }
          this.isStarted = true;
        }
        elapsed = time - this.props.startTime;
        if (elapsed <= this.o.duration) {
          this.setProc(elapsed / this.o.duration);
        } else {
          start = this.props.startTime;
          isDuration = false;
          cnt = 0;
          while (start <= time) {
            isDuration = !isDuration;
            start += isDuration ? (cnt++, this.o.duration) : this.o.delay;
          }
          if (isDuration) {
            start = start - this.o.duration;
            elapsed = time - start;
            this.setProc(elapsed / this.o.duration);
            if (this.o.yoyo && this.o.repeat) {
              this.setProc(cnt % 2 === 1 ? this.progress : 1 - (this.progress === 0 ? 1 : this.progress));
            }
          } else {
            this.setProc(this.prevTime < time ? 1 : 0);
          }
        }
        if (time < this.prevTime && !this.isFirstUpdateBackward) {
          if ((_ref2 = this.o.onFirstUpdateBackward) != null) {
            _ref2.apply(this);
          }
          this.isFirstUpdateBackward = true;
        }
      } else {
        if (time >= this.props.endTime && !this.isCompleted) {
          this.setProc(1);
          if ((_ref3 = this.o.onComplete) != null) {
            _ref3.apply(this);
          }
          this.isCompleted = true;
          this.isOnReverseComplete = false;
        }
        if (time > this.props.endTime || time < this.props.startTime) {
          this.isFirstUpdate = false;
        }
        if (time > this.props.endTime) {
          this.isFirstUpdateBackward = false;
        }
      }
      if (time < this.prevTime && time <= this.props.startTime) {
        if (!this.isFirstUpdateBackward) {
          if ((_ref4 = this.o.onFirstUpdateBackward) != null) {
            _ref4.apply(this);
          }
          this.isFirstUpdateBackward = true;
        }
        if (!this.isOnReverseComplete) {
          this.isOnReverseComplete = true;
          this.setProc(0, !this.o.isChained);
          if ((_ref5 = this.o.onReverseComplete) != null) {
            _ref5.apply(this);
          }
        }
      }
      this.prevTime = time;
      return this.isCompleted;
    };

    Tween.prototype.setProc = function(p, isCallback) {
      if (isCallback == null) {
        isCallback = true;
      }
      this.progress = p;
      this.easedProgress = this.props.easing(this.progress);
      if (this.props.prevEasedProgress !== this.easedProgress && isCallback) {
        if (typeof this.onUpdate === "function") {
          this.onUpdate(this.easedProgress);
        }
      }
      return this.props.prevEasedProgress = this.easedProgress;
    };

    Tween.prototype.setProp = function(obj, value) {
      var key, val;
      if (typeof obj === 'object') {
        for (key in obj) {
          val = obj[key];
          this.o[key] = val;
        }
      } else if (typeof obj === 'string') {
        this.o[obj] = value;
      }
      return this.calcDimentions();
    };

    Tween.prototype.parseEasing = function(easing) {
      var type;
      type = typeof easing;
      if (type === 'string') {
        if (easing.charAt(0).toLowerCase() === 'm') {
          return easingModule.path(easing);
        } else {
          easing = this.splitEasing(easing);
          return easingModule[easing[0]][easing[1]];
        }
      }
      if (h.isArray(easing)) {
        return easingModule.bezier.apply(easingModule, easing);
      }
      if ('function') {
        return easing;
      }
    };

    Tween.prototype.splitEasing = function(string) {
      var firstPart, secondPart, split;
      if (typeof string === 'function') {
        return string;
      }
      if (typeof string === 'string' && string.length) {
        split = string.split('.');
        firstPart = split[0].toLowerCase() || 'linear';
        secondPart = split[1].toLowerCase() || 'none';
        return [firstPart, secondPart];
      } else {
        return ['linear', 'none'];
      }
    };

    Tween.prototype.run = function(time) {
      this.start(time);
      !time && ((function() {
        return t.add(this);

        /*@state = 'play' */
      }).call(this));
      return this;
    };

    Tween.prototype.stop = function() {
      this.pause();
      this.setProc(0);
      return this;
    };

    Tween.prototype.pause = function() {
      this._removeFromTweener();
      return this;
    };

    Tween.prototype._removeFromTweener = function() {
      t.remove(this);
      return this;
    };

    return Tween;

  })();

  module.exports = Tween;

}).call(this);
