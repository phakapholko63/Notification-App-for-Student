const express = require('express');
const mysql = require('mysql');
const env = require('./env.js');
const dbconfig = require('./dbconfig.js')[env];

const app = express()
app.use(express.json())
const port = 3000

const connection = mysql.createConnection(dbconfig)

connection.connect((err) => {
    if (err) {
        console.log('Error connecting to MySQL database = ', err)
        return;
    } else {
        console.log('MySQL sucesssfully connected!')
    }
})

app.get("/api/subjects", async (req, res) => {
    try {
        connection.query("SELECT * FROM subjects", (err, results, fields) => {
            if(err) {
                return res.status(400).send();
            } else {
                res.status(200).json(results)
            }
        })
    } catch(err) {
        return res.statusI(500).send();
    }
})

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`)
})