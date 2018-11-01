function Gun(shots) {
    this.chambers = new Array(shots);
    this.current = 0;
    this.loaded = Math.floor(Math.random() * shots);

    this.shoot = function () {
        const fire = !this.isOut();
        this.current = this.isOut() ? this.current : this.current + 1
        return fire;
    }

    this.getCurrent = function() {
        return this.current + 1
    }

    this.getChambers = function() {
        return this.chambers.length
    }

    this.getLoaded = function() {
        return this.loaded + 1
    }

    this.isOut = function() {
        return this.current > this.getChambers() - 1
    }
}


g = new Gun(6)
console.log(g.getCurrent())
console.log(g.getChambers())
console.log(g.getLoaded())
console.log(g.isOut())
console.log(g.shoot())

