const express = require('express');

const app = express();

app.get('/user/1', (req, res) => {
  res.send('{"id": 1, "name": "demo", "job": "staff", "age": 20}');
});

app.listen(3000, () => {
  console.log('server started on port 3000.');
});
