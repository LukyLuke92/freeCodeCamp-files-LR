'use strict';

const expect = require('chai').expect;
const ConvertHandler = require('../controllers/convertHandler.js');

module.exports = function (app) {

  app.route('/api/convert?')
    .get((req,res) => {
      try {
        getConvData(req.query.input);
      } catch (error) {
        res.send(error.message.replace(/Error: /,''));
      } finally {
        res.json(getConvData(req.query.input));
      }
    })
  app.route('/api/convert')
    .get((req,res) => {
      res.data(getConvData(req.body.input));
    })
};

let convertHandler = new ConvertHandler();
const getConvData = (input) => {
  let initNum;
  // See if both getNum and getUnit fail
  try {
    initNum = convertHandler.getNum(input);
  } catch(error) {
    try {
      convertHandler.getUnit(input);
    } catch(error) {
      throw Error('invalid number and unit')
    }
    throw Error(error);
  }
  /*
  try {
    initNum = convertHandler.getNum(input);
  } catch (error) {
    throw Error(error);
  }
  */
  let initUnit;
  try {
    initUnit = convertHandler.getUnit(input);
  } catch (error) {
    throw Error(error);
  }
  const returnNum = convertHandler.convert(initNum,initUnit);
  const returnUnit = convertHandler.getReturnUnit(initUnit);
  const returnString = convertHandler.getString(initNum,initUnit,returnNum,returnUnit);
  return {
    initNum: initNum,
    initUnit: initUnit,
    returnNum: returnNum,
    returnUnit: returnUnit,
    string: returnString
  }
}