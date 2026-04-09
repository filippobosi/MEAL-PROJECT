import mysql, { Connection } from 'mysql2'

export const connection: Connection = mysql.createConnection({
  host: 'database',
  user: 'root',
  password: '',
  database: 'meal1'
})
