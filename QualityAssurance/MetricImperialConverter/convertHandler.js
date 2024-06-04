function ConvertHandler() {
  
  this.getNum = function(input) {
    let result;
    // find consecutive string of characters that contain
    // only digits, decimal points, and division signs
    result = input.match(/[\d./]+/);
    if (!result) {
      // if nothing was found, then return 1 as default
      return 1;
    } else if (result[0].toString().match(/\//g) && result[0].toString().match(/\//g).length > 1) {
      // if division is attempted more than once, throw
      // an error
      throw Error('invalid number')
    }
    // if result exists and there are no errors, eval()
    return eval(result[0]);
  };
  
  this.getUnit = function(input) {
    let result;
    unitsRegex = /gal$|L$|mi$|km$|lbs$|kg$/i;
    result = input.match(unitsRegex);
    if (!result) {
      throw Error('invalid unit')
    }
    return result[0].match(/^L$/i) ?
      result[0].toUpperCase() :
      result[0].toLowerCase();
  };
  
  this.getReturnUnit = function(initUnit) {
    let result;
    switch (initUnit) {
      case 'gal':
        result = 'L';
        break;
      case 'L':
        result = 'gal';
        break;
      case 'mi':
        result = 'km';
        break;
      case 'km':
        result = 'mi';
        break;
      case 'lbs':
        result = 'kg';
        break;
      case 'kg':
        result = 'lbs';
        break;
      default:
        throw Error('invalid unit')
    }
    return result;
  };

  this.spellOutUnit = function(unit) {
    let result;
    switch (unit) {
      case 'kg':
        result = 'kilograms';
        break;
      case 'lbs':
        result = 'pounds';
        break;
      case 'mi':
        result = 'miles';
        break;
      case 'km':
        result = 'kilometers';
        break;
      case 'gal':
        result = 'gallons';
        break;
      case 'L':
        result = 'liters';
        break;
      default:
        throw Error('invalid unit');
    }
    return result;
  };
  
  this.convert = function(initNum, initUnit) {
    const galToL = 3.78541;
    const lbsToKg = 0.453592;
    const miToKm = 1.60934;
    let result = [];
    switch (initUnit) {
      case 'kg':
        result = initNum / lbsToKg;
        break;
      case 'lbs':
        result = initNum * lbsToKg;
        break;
      case 'mi':
        result = initNum * miToKm;
        break;
      case 'km':
        result = initNum / miToKm;
        break;
      case 'gal':
        result = initNum * galToL;
        break;
      case 'L':
        result = initNum / galToL;
        break;
      default:
        throw Error('invalid unit');
    }
    return Math.round(result*100000)/100000;
  };
  
  this.getString = function(initNum, initUnit, returnNum, returnUnit) {
    let result;
    result = `${initNum} ${this.spellOutUnit(initUnit)} converts to ${returnNum} ${this.spellOutUnit(returnUnit)}`
    return result;
  };
  
}

module.exports = ConvertHandler;
