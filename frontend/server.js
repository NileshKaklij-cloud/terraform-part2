const express = require('express');
const axios = require('axios');

const app = express();

const BACKEND_URL = "http://<BACKEND_PUBLIC_IP>:5000";

app.get('/', async (req, res) => {
    try {
        const response = await axios.get(BACKEND_URL);
        res.send(`Frontend received: ${response.data.message}`);
    } catch (err) {
        res.send("Error connecting to backend");
    }
});

app.listen(3000, () => console.log("Server running on port 3000"));
