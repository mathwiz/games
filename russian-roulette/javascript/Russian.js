const repl = require('repl');
const Gun = require('./Gun');
const Game = require('./Game');
const game = new Game(new Gun(6));

const replServer = repl.start({
    prompt: game.getPrompt() + " > ",

    eval: function(cmd, context, filename, callback) {
        callback(null, cmd)
    }
})


replServer.context.n = function () { console.log("Chicken!") };
