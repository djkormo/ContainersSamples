'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';
const language = 'English';
const API_KEY = '123-456-789';
// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello world\n');
  
  response.write(`Language: ${language}\n`);
  response.write(`API Key: ${API_KEY}\n`);
response.end(`\n`);
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);

