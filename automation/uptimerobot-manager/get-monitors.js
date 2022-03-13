const fs = require('fs');

const monitors = JSON.parse(fs.readFileSync('./stubborn-monitors.json')).monitors;

monitors.map((item) => console.log(item.id));
