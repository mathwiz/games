function Game(gun) {
    this.gun = gun;

    this.getPrompt = function() {
        return "Shoot? [Y/n]"
    }

    this.getPreamble = function(shots) {
        return "Shooting ${shots} shots"
    }

    this.play = function() {
        const g = this.gun;
        console.log(g.isOut())
        console.log(g.getChambers())
        console.log(g.getLoaded())
        console.log(g.getCurrent())
        console.log(g.shoot())
        console.log(g.getCurrent())
        console.log(g.shoot())
        console.log(g.getCurrent())
        console.log(g.shoot())
        console.log(g.getCurrent())
        console.log(g.shoot())
        console.log(g.getCurrent())
        console.log(g.shoot())
        console.log(g.getCurrent())
        console.log(g.shoot())
        console.log(g.getCurrent())
        console.log(g.shoot())
        console.log(g.getCurrent())
    }
}

module.exports = Game;