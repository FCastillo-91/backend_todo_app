const express = require("express");
const serverless = require("serverless-http");
const cors = require("cors");
const bodyParser = require("body-parser");
const mysql = require("mysql");

const app = express();
app.use(cors());
app.use(bodyParser.json());

const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: "todos"
});

app.get("/tasks", function(req, res) {
  connection.query("SELECT * FROM Tasks", function(err, data) {
    if (err) {
      res.status(500).json({
        error: err
      })
    } else {
      const mapped = data.map(task => {
        task.completed = (task.completed === 1 ? true : false);
        task.urgency = (task.urgency === 1 ? true : false);
        return task;
      })
      res.status(200).json({
        todos: data
      });
    }
  });
});

app.post("/tasks", function(req, res) {
  const newTask = req.body
  const randomUserId = Math.floor(Math.random() * (3-1)) + 1;

  connection.query("INSERT INTO Tasks SET ?", [newTask, randomUserId], function(err, data) {
    if (err) {
      res.status(500).json({
        error: err
      });
    } else {
      newTask.taskId = data.insertId;
      newTask.userId = randomUserId;
      res.status(201).json({newTask});
    }
  }); 
});

app.delete("/tasks/:taskId", function (req, res) {
  const id = req.params.taskId;

  connection.query("DELETE FROM Tasks WHERE taskId=?", [id], function (err) {
    if (err) {
      res.status(500).json({
        error: err
      });
    } else {
      res.sendStatus(200);
    }
  });
});

app.put("/tasks/:taskId", function (req, res) {
  const updatedTask = req.body;
  const id = req.params.taskId; 
  const randomUserId = Math.floor(Math.random() * (3-1)) + 1;

  connection.query("UPDATE Tasks SET ? WHERE taskId=?", [updatedTask, id, randomUserId], function(err) {
    if (err) {
      res.status(500).json({error: err})
    } else {
      res.sendStatus(200);
    }
  });
});

module.exports.handler = serverless(app);