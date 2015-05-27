(function() {
  var PathEasing, h;

  h = require('./h');

  PathEasing = (function() {
    function PathEasing(path, o) {
      var _ref;
      if (o == null) {
        o = {};
      }
      if (path === 'creator') {
        return;
      }
      this.path = h.parsePath(path);
      this.pathLength = (_ref = this.path) != null ? _ref.getTotalLength() : void 0;
      this.precision = o.precision || 24;
      this.rect = o.rect || 100;
      this.sample = h.bind(this.sample, this);
      this;
    }

    PathEasing.prototype.sample = function(p, start, end, precision) {
      var center, newEnd, newStart, point, rect;
      if (start == null) {
        start = 0;
      }
      if (end == null) {
        end = 1;
      }
      if (precision == null) {
        precision = this.precision;
      }
      p = h.clamp(p, 0, 1);
      center = start + ((end - start) / 2);
      point = this.path.getPointAtLength(this.pathLength * center);
      rect = this.rect;
      if (rect * p > point.x) {
        newStart = center;
        newEnd = end;
      } else if (rect * p < point.x) {
        newStart = start;
        newEnd = center;
      } else {
        return 1 - point.y / rect;
      }
      if (--precision < 1) {
        return 1 - point.y / rect;
      } else {
        return this.sample(p, newStart, newEnd, precision);
      }
    };

    PathEasing.prototype.create = function(path, o) {
      return (new PathEasing(path, o)).sample;
    };

    return PathEasing;

  })();

  module.exports = PathEasing;

}).call(this);
