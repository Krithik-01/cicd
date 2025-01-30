const express = require('express');
const app = express();
const port = 3000;

app.use(express.json());

let todos = [
  { id: 1, task: 'Learn Jenkins' },
  { id: 2, task: 'Learn Terraform' }
];

app.get('/todos', (req, res) => {
  res.json(todos);
});

app.post('/todos', (req, res) => {
  const newTodo = req.body;
  todos.push(newTodo);
  res.status(201).json(newTodo);
});

app.listen(port, () => {
  console.log(`Todo app listening at http://localhost:${port}`);
});
