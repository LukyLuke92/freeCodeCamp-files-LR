const chaiHttp = require('chai-http');
const chai = require('chai');
let assert = chai.assert;
const server = require('../server');

chai.use(chaiHttp);

suite('Functional Tests', function() {
    test('#convert on correct get', done => {
        chai.request(server)
            .keepOpen()
            .get('/api/convert?input=10L')
            .end((err,res) => {
                assert.equal(res.status,200);
                assert.include(res._body,{returnNum: 2.64172})
                done();
            })
    })
    test('#convert on invalid unit', done => {
        chai.request(server)
            .keepOpen()
            .get('/api/convert?input=3g')
            .end((err,res) => {
                assert.equal(res.status,200);
                assert.equal(res.text,'invalid unit')
                done();
            })
    })
    test('#convert on invalid number', done => {
        chai.request(server)
            .keepOpen()
            .get('/api/convert?input=3/7.2/4kg')
            .end((err,res) => {
                assert.equal(res.status,200);
                assert.equal(res.text,'invalid number')
                done();
            })
    })
    test('#convert on invalid number and unit', done => {
        chai.request(server)
            .keepOpen()
            .get('/api/convert?input=3/7.2/4kilomegagram')
            .end((err,res) => {
                assert.equal(res.status,200);
                assert.equal(res.text,'invalid number and unit')
                done();
            })
    })
    test('#convert on no number', done => {
        chai.request(server)
            .keepOpen()
            .get('/api/convert?input=kg')
            .end((err,res) => {
                assert.equal(res.status,200);
                assert.include(res._body,{returnNum: 2.20462})
                done();
            })
    })
});
