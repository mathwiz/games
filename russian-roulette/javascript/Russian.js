const repl = require('repl');
const Gun = require('./Gun');
const Game = require('./Game');

const g = new Gun(6);
const game = new Game(g);

console.log(game.getPreamble(g.getChambers()));
console.log(g.getCurrent());

const replServer = repl.start({
    prompt: game.getPrompt() + " ",

    eval: function(cmd, context, filename, callback) {
        if (cmd.length > 0 && cmd[0] === 'n') {
            console.log("Chicken!");
            process.exit();
        } else {
            if (game.play()) {
                callback(null, g.getCurrent());
            } else {
                process.exit();
            }
        }
    }
});


replServer.context.game = game;
