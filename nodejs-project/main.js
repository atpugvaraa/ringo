var express = require('express');
var fs = require('fs');
var path = require('path');
var app = express();

app.disable('x-powered-by');
app.set('json spaces', 2);

app.get('/', function (req, res) {
  res.json({
    routes: ['GET /health', 'GET /ls?dir=', 'GET /download?dir=&file=', 'POST /upload?dir=']
  });
});

app.get('/health', function (req, res) {
  res.json({ ok: true, node: process.version, uptime: process.uptime() });
});

app.get('/ls', function (req, res) {
  var dir = req.query.dir || '/var/mobile';
  try {
    var entries = fs.readdirSync(dir, { withFileTypes: true });
    var items = entries.map(function (e) {
      return { name: e.name, type: e.isDirectory() ? 'dir' : 'file' };
    });
    res.json({ path: dir, entries: items });
  } catch (err) {
    res.status(500).json({ error: err.message, path: dir });
  }
});

app.get('/download', function (req, res) {
  var dir = req.query.dir;
  var file = req.query.file;
  if (!dir || !file) {
    return res.status(400).json({ error: 'need dir and file params' });
  }
  var safeName = path.basename(file);
  var fullPath = path.join(dir, safeName);
  if (!fs.existsSync(fullPath)) {
    return res.status(404).json({ error: 'not found', path: fullPath });
  }
  res.download(fullPath, safeName);
});

app.listen(3000, function () {
  console.log('Express app listening on port 3000');
});
