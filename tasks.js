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
      res.status(200).json({
        todos: data
      });
    }
  });
});

app.post("/tasks", function(req, res) {
  const newTask = req.body
  // const newTaskText = req.body.task_Text;
  // const newTaskDueDate = req.body.due_Date;
  // const newTaskCompletedValue = req.body.completed;

  connection.query("INSERT INTO Tasks SET ?", [newTask], function(err, data) {
    if (err) {
      res.status(500).json({
        error: err
      });
    } else {
      newTask.taskId = data.insertId;
      res.status(201).json({newTask});
    }
  }); 
});

app.delete("/tasks/:taskId", function (req, res) {
  const id = req.params.taskId;

  res.json({
    message: `Successfully deleted task with ID ${id}`
  });
});

app.put("/tasks/:taskId", function (req, res) {
  const updatedTask = req.body;
  const id = req.params.taskId; 

  res.json({
    message: `Successfully updated task ID ${id} with task: ${updatedTask.text}, date: ${updatedTask.date}`
  });
});

module.exports.handler = serverless(app);