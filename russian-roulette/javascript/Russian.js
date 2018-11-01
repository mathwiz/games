const gun = require('./Gun');
const g = new gun.Gun(6);

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

