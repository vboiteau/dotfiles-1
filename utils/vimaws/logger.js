const bunyan = require('bunyan');
const bformat = require('bunyan-format');
const { name } = require('./package.json');

const formatOut = bformat({
    outputMode: 'long',
    color: true,
    levelInString: true,
    src: true
});

const errorOut = bformat({
    outputMode: 'long',
    color: true,
    levelInString: true,
    src: true
}, process.stderr);


const logger = bunyan.createLogger({
    name,
    streams: [{
        stream: formatOut,
        level: 'debug'
    }, {
        stream: errorOut,
        level: 'error'
    }],
    level: 'debug',
    src: true
});

module.exports = logger;
