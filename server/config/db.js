const mysql = require('mysql')
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '123456',
  database: 'flashfloodforcast',

  // host: 'isodev.picp.net',
  // user: 'root',
  // password: 'zyjz_123456',
  // database: 'driven_well',
  // port: '3306',
})

module.exports = function (sql, placeHolder) {
  return new Promise(function (resolve, reject) {
    pool.getConnection(function (err, conn) {
      if (err) {
        reject(err)
      } else {
        conn.query(sql, placeHolder, function (e, rows, fields) {
          conn.release()
          resolve({ err: e, rows: rows, fields: fields })
        })
      }
    })
  })
}
