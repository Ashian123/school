class Select {
  constructor({ table = "", col = [], where = "", from = "", to = "" }) {
    this.table = table;
    this.col = col;
    this.where = where;
    this.from = from;
    this.to = to;
    this.schema = schema;
  }
  find() {
    if (!this.table) return;

    return new Promise((resolve) => {
      let sql = this.where
        ? `SELECT ${this.column(this.col)} FROM ${this.schema}.${
            this.table
          } WHERE ${this.where}`
        : `SELECT ${this.column(this.col)} FROM ${this.schema}.${this.table}`;
      db.query(sql, (err, data) => {
		 console.log(sql);
        resolve(data || err);
      });
    });
  }

  findWithLimit() {
    if (!this.table) return;

    return new Promise((resolve) => {
      let sql = this.where
        ? `SELECT ${this.column(this.col)} From ${this.schema}.${
            this.table
          } WHERE ${this.where} LIMIT ${this.from},${this.to}`
        : `SELECT ${this.column(this.col)} From ${this.schema}.${
            this.table
          }  LIMIT ${this.from},${this.to}`;
      // console.log(sql);
      db.query(sql, (err, data) => {
        resolve(data || err);
      });
    });
  }

  column(data) {
    return data == "" ? "*" : data.join(",");
  }
}
class Insert {
  constructor({ table = "", col = [], val = [] }) {
    this.table = table;
    this.col = col;
    this.val = val;
    this.schema = schema;
  }
  add() {
    if (!this.table) return;

    return new Promise((resolve) => {
      let sql = `INSERT INTO ${this.schema}.${this.table} (${this.column(
        this.col
      )}) VALUES ('${this.value(this.val)}')`;

      db.query(sql, (err, data) => {
        resolve(data || err);
      });
    });
  }
  addBulk() {
    return new Promise((resolve) => {
      let sql = `INSERT INTO ${this.schema}.${this.table} (${this.column(
        this.col
      )}) VALUES ${this.bulkValue(this.val)}`;
      db.query(sql, (err, data) => {
        resolve(data || err);
      });
    });
  }
  column(data) {
    return data == "" ? "*" : data.toString();
  }
  value(data) {
    return data == "" ? "*" : data.join("','");
  }
  bulkValue(data) {
    return data == "" ? "*" : data.join();
  }
}
class Update {
  constructor({ table = "", col = [], val = [], where = "" }) {
    this.table = table;
    this.col = col;
    this.val = val;
    this.where = where;
    this.schema = schema;
  }

  updateOne() {
    if (!this.table) return;

    return new Promise((resolve) => {
      let sql = `UPDATE  ${this.schema}.${this.table} SET ${this.column(
        this.col,
        this.val
      )} WHERE ${this.where}`;

      db.query(sql, (err, data) => {
        resolve(data || err);
      });
    });
  }
  column(column, value) {
    let array = [];
    let i = 0;
    for (i; i < column.length; i++) {
      array.push(`${column[i]}='${value[i]}'`);
    }
    return array.join(",");
  }
}

class Delete {
  constructor({ table = "", where = "" }) {
    this.table = table;
    this.where = where;
    this.schema = schema;
  }
  deleteOne() {
    if (!this.table) return;

    return new Promise((resolve) => {
      let sql = `DELETE FROM  ${this.schema}.${this.table}  WHERE ${this.where}`;
      db.query(sql, (err, data) => {
        resolve(data || err);
      });
    });
  }
}
module.exports = { Select, Insert, Update, Delete };
