define(["game/views/stage", "game/controllers/square"], function(StageView, SquareController) {
  var App;
  return App = function(prop) {
    window.game = {
      stage: new StageView,
      square: new SquareController,
      start: function() {
        var i, run, _results;
        i = 0;
        run = ["stage", "square"];
        _results = [];
        while (i < run.length) {
          game[run[i]].init();
          _results.push(i++);
        }
        return _results;
      }
    };
    return game.start();
  };
});

//# sourceMappingURL=app.js.map
