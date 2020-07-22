const express = require("express");
const redis = require("redis");
const process = require("process");

// Constants for host and port
const PORT = 8000;
const HOST = '0.0.0.0';
const REDIS_PORT = 6379;

// Creating the instance of express app
const app = express();

// Defining redis client
const redis_client = redis.createClient({
    host: "redis-server",
    port: REDIS_PORT
});

// Setting the visits to 1 in redis in starting
redis_client.set("visits", 1);


// Defining logic when user visits the root or home page
app.get("/", (req, res) => {
    //process.exit(0)

    // Getting the visit count
    redis_client.get("visits", (err, visits) => {
        // Incrementing the visit count by 1
        redis_client.set("visits", parseInt(visits) + 1);
        res.send("Number of visits " + visits);
    });
});

// Listening at the particular port
app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
