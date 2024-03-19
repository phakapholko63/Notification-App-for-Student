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

app.get("/api/teachers", async (req, res) => {
    try {
        connection.query("SELECT * FROM teachers", (err, results, fields) => {
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

app.get("/api/students", async (req, res) => {
    try {
        connection.query("SELECT * FROM students", (err, results, fields) => {
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

app.post("/api/addsubject", async (req, res) => {

    const { subject_name, subject_des } = req.body;

    try {
        connection.query(
            "INSERT INTO subjects(subject_name, subject_des) VALUES(?, ?)",
            [subject_name, subject_des],
            (err, results, fields) => {
            if(err) {
                return res.status(400).send();
            } else {
                res.status(201).json({ message: "New subject successfully created!"})
            }
        })
    } catch(err) {
        return res.status(500).send();
    }
})

app.post("/api/addteacher", async (req, res) => {

    const { teacher_name, teacher_des } = req.body;

    try {
        connection.query(
            "INSERT INTO teachers(teacher_name, teacher_des) VALUES(?, ?)",
            [teacher_name, teacher_des],
            (err, results, fields) => {
            if(err) {
                return res.status(400).send();
            } else {
                res.status(201).json({ message: "New teacher successfully created!"})
            }
        })
    } catch(err) {
        return res.status(500).send();
    }
})

app.post("/api/addstudent", async (req, res) => {

    const { student_name, student_des } = req.body;

    try {
        connection.query(
            "INSERT INTO students(student_name, student_des) VALUES(?, ?)",
            [student_name, student_des],
            (err, results, fields) => {
            if(err) {
                return res.status(400).send();
            } else {
                res.status(201).json({ message: "New student successfully created!"})
            }
        })
    } catch(err) {
        return res.status(500).send();
    }
})

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`)
})