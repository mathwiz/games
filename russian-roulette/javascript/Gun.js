function Gun(shots) {
    this.chambers = shots;
    this.current = 1;
    this.loaded = Math.floor(Math.random() * shots) + 1;

    this.shoot = function () {
        const fire = !this.isOut() && this.loaded == this.current;
        this.current = this.isOut() ? this.current : this.current + 1
        return fire;
    }

    this.getCurrent = function() {
        return this.current
    }

    this.getChambers = function() {
        return this.chambers
    }

    this.getLoaded = function() {
        return this.loaded
    }

    this.isOut = function() {
        return this.current == this.chambers
    }
}

module.exports = Gun;