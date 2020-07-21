// Express is a minimal and flexible Node.js web application framework
const express = require('express');

// Constants for host and port
const PORT = 8000;
const HOST = '0.0.0.0';

// Creating the app
const app = express();

// Defining logic when user visits the root or home page
app.get('/', (req, res) => {
    res.send('Hello World');
});

// Listening at the particular port
app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
