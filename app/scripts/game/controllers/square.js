define(function() {
  var SquareController;
  return SquareController = (function() {
    function SquareController() {}

    SquareController.prototype.init = function() {
      this.getElements();
      this.randomWalk(2000, 1);
      return this.animate();
    };

    SquareController.prototype.getElements = function() {
      this.square = {
        scale: 100,
        color: "#000000",
        pos: {
          x: window.innerWidth / 2,
          y: window.innerHeight / 2,
          r: 0
        },
        points: [
          {
            x: 1,
            y: 1
          }, {
            x: -1,
            y: 1
          }, {
            x: -1,
            y: -1
          }, {
            x: 1,
            y: -1
          }, {
            x: 1,
            y: 1
          }
        ]
      };
      return game.stage.render(this.square);
    };

    SquareController.prototype.ease = function(current, target) {
      var output;
      output = 0;
      if (Math.abs(target - current) > 1) {
        output = current + ((target - current) / 5);
      }
      return output;
    };

    SquareController.prototype.randomWalk = function(rateChange, spd) {
      this.speed = spd;
      return setInterval((function(_this) {
        return function() {
          return _this.direction = Math.floor(Math.random() * 4);
        };
      })(this), rateChange);
    };

    SquareController.prototype.animate = function() {
      return setInterval((function(_this) {
        return function() {
          switch (_this.direction) {
            case 0:
              return _this.square.pos.x += _this.speed;
            case 1:
              return _this.square.pos.x -= _this.speed;
            case 2:
              return _this.square.pos.y += _this.speed;
            case 3:
              return _this.square.pos.y -= _this.speed;
          }
        };
      })(this), 1000 / 60);
    };

    return SquareController;

  })();
});

//# sourceMappingURL=square.js.map
