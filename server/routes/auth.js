const conn = require('../config/db')
const md5 = require('md5-node')
const jwt = require('../utils/jwt')
const { response } = require('express')

module.exports = (app) => {
  app.post('/api/login', async (req, res) => {
    let { username, password } = req.body
    password = md5(password)

    const sql = 'select * from sysuser where ?? =? and ??=?'
    const placeHolder = ['username', username, 'password', password]
    const { err, rows } = await conn(sql, placeHolder)
    if (err) {
      res.send({ data: null, meta: { status: 404, msg: err } })
      return
    }
    if (rows.length < 1) {
      res.send({ data: null, meta: { status: 404, msg: '用户名或者密码错误' } })
      return
    }
    const data = { username: username }
    const result = rows[0]
    result.token = jwt.generate(data)
    res.send({ data: result, meta: { status: 200, msg: err } })

  })
  app.get('/menulist/:roleId', (req, res) => {
    console.log(req.body);
  })
}