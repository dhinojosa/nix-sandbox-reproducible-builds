// index.js
// A very simple Node app to demonstrate running inside a Nix-built Docker image

// Print a greeting
console.log("👋 Hello from inside a Nix-built Docker container!");

// Show environment info (Node version, working dir)
console.log("Node version:", process.version);
console.log("Working directory:", process.cwd());

// Optional: simple HTTP server on port 3000 (uncomment to test networking)
// const http = require('http');
// const server = http.createServer((req, res) => {
//   res.writeHead(200, { 'Content-Type': 'text/plain' });
//   res.end('Hello from Node inside Nix Docker container!\n');
// });
// server.listen(3000, () => console.log('Server running on port 3000'));