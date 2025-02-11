const pool = require('../utils/db');

const getUserByUsername = async (username) => {
  const [rows] = await pool.query('SELECT * FROM users WHERE username = ?', [username]);
  return rows[0];
};

module.exports = { getUserByUsername };