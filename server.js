const express = require('express');
const path = require('path');
const app = express();
const port = 3000;

// Serve static files from the "videos" directory
app.use('/videos', express.static(path.join(__dirname, 'videos')));

// Serve the merged video and HTML file
app.use('/', express.static(path.join(__dirname)));

// Serve the HTML file
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
