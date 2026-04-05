const express = require('express');
const axios   = require('axios');
const app     = express();

 /*const FLASK_URL = process.env.FLASK_URL || 'http://localhost:5000';*/
const FLASK_URL = "http://15.207.249.119:5000";
app.get('/', async (req, res) => {
  try {
    const { data } = await axios.get(FLASK_URL);
    res.json({
      service : 'Express Frontend',
      port    : 3000,
      backend : data,
      message : 'Both services are running!'
    });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.get('/health', (req, res) => res.json({ healthy: true }));

app.listen(3000, '0.0.0.0', () => console.log('Express running on port 3000'));


