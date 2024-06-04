const chai = require('chai');
let assert = chai.assert;
const ConvertHandler = require('../controllers/convertHandler.js');
let convertHandler = new ConvertHandler();

suite('Unit Tests', function(){
    test('#get number', function() {
        assert.equal(convertHandler.getNum('32kg'),32,'convertHandler is not correctly returning a number');
    })
    test('#get decimal', function() {
        assert.equal(convertHandler.getNum('3.2kg'),3.2,'convertHandler is not correctly returning a decimal')
    })
    test('#get fractional', function() {
        assert.equal(convertHandler.getNum('7/2kg'),7/2,'convertHandler is not correctly returning a decimal')
    })
    test('#get fractional', function() {
        assert.equal(convertHandler.getNum('7.2/2kg'),7.2/2,'convertHandler is not correctly returning a decimal')
    })
    test('#divide only once', function() {
        assert.throws(() => {
            convertHandler.getNum('5.2/3.2/3')
        },'invalid number')
    })
    test('#default to 1', function () {
        assert.equal(convertHandler.getNum('kg'),1,'convertHandler is not correctly returning 1 as default value')
    })
    test('#get units', function () {
        assert.equal(convertHandler.getUnit('3KG'),'kg','convertHandler is not correctly returning units')
    })
    test('#wrong units', function () {
        assert.throws( () => {
            convertHandler.getUnit('3flims')
        }, 'invalid unit')
    })
    test('#returns unit', function () {
        assert.equal(convertHandler.getReturnUnit('gal'),'L','convertHandler is not returning the correct unit')
    })
    test('#spells out unit', function () {
        assert.equal(convertHandler.spellOutUnit('km'),'kilometers','convertHandler is not returning the correct spelled out unit')
    })
    test('#converts gal to L', function () {
        assert.equal(convertHandler.convert(3,'gal'),Math.round(3*3.78541*100000)/100000,'convertHandler is not returning the converted value')
    })
    test('#converts L to gal', function () {
        assert.equal(convertHandler.convert(3,'L'),Math.round(3/3.78541*100000)/100000,'convertHandler is not returning the converted value')
    })
    test('#converts mi to km', function () {
        assert.equal(convertHandler.convert(3,'mi'),Math.round(3*1.60934*100000)/100000,'convertHandler is not returning the converted value')
    })
    test('#converts km to mi', function () {
        assert.equal(convertHandler.convert(3,'km'),Math.round(3/1.60934*100000)/100000,'convertHandler is not returning the converted value')
    })
    test('#converts lbs to kg', function () {
        assert.equal(convertHandler.convert(3,'lbs'),Math.round(3*0.453592*100000)/100000,'convertHandler is not returning the converted value')
    })
    test('#converts kg to lbs', function () {
        assert.equal(convertHandler.convert(3,'kg'),Math.round(3/0.453592*100000)/100000,'convertHandler is not returning the converted value')
    })
    test('#return string', function () {
        assert.equal(convertHandler.getString(3,'kg',convertHandler.convert(3,'kg'),'lbs'),`3 kilograms converts to ${Math.round(3/0.453592*100000)/100000} pounds`,'convertHandler is not returning the converted value')
    })
});