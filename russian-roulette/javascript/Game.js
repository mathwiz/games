function Game(gun) {
    this.gun = gun;

    this.getPrompt = function() {
        return "Shoot? [Y/n]";
    };

    this.getPreamble = function(shots) {
        return `Shooting ${shots} shots`;
    };

    this.play = function() {
        const bullet = this.gun.shoot();
        if (bullet) {
            console.log("Bang! You're dead!");
        } else {
            console.log("Whew! No bullet.");
        }
        return !bullet;
    }
}

module.exports = Game;