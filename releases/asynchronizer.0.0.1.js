/*! asynchronizer 0.0.1, Copyright 2014 Kevin Goslar, see https://github.com/kevgo/asynchronizer.js */
(function(){var a;a=function(){function a(a,b){this.callback=b,this.remaining_conditions=a,this.values=[]}return a.prototype.check=function(a,b){return b&&this.values.push(b),this.remaining_conditions=_.without(this.remaining_conditions,a),0===this.remaining_conditions.length?this.callback(this.values):void 0},a}(),module&&(module.exports=a),"undefined"!=typeof window&&null!==window&&(window.Asynchronizer=a)}).call(this);