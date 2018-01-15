#!/usr/bin/env node

const fetch = require('node-fetch');
const prompt = require('inquirer').createPromptModule();
const program = require('commander');
const { spawn } = require('child_process');
const Table = require('cli-table');

const logger = require('./logger');
const { version } = require('./package');

const createSubmodule = (name, url) => {
    logger.debug(name, url);
    const script = spawn('sh', ['createSubmodule.sh', name, url]);

    script.stdout.on('data', data => {
        logger.info(data.toString());
    });

    script.stderr.on('data', data => {
        logger.error(data.toString());
    });

    script.on('close', code => {
        logger.info(`Child process exited with code ${code}.`);
    });
};

const processSearchResult = json => {
    const table = new Table({
        head: [
            'i',
            'info',
            'stars'
        ],
        colWidths: [5,80,8]
    });


    prompt([{
        type: 'list',
        name: 'pluginToInstall',
        message: 'Plugin to install:',
        choices: json.plugins.map(({ name, short_desc, github_stars }, i) => `${i}\t${name}\t${short_desc}\t${github_stars}`)
    }, {
        type: 'list',
        name: 'action',
        message: 'What should to do:',
        choices: ['add', 'cancel']
    }])
        .then(answer => {
            const [choiceIndex] = answer.pluginToInstall.match(/^(\d*)/);
            const choice = json.plugins[choiceIndex];
            if (answer.action === 'add') {
                logger.debug(choice);
                createSubmodule(choice.name, choice.github_url); 
            }
        });

};

const search = query => fetch(`https://vimawesome.com/api/plugins?query=${query}`)
    .then(res => res.json())
    .then(processSearchResult)
    .catch(err => logger.error(err));

program
    .version(version)
    .option('-s, --search <query>', 'Plugin to search', search)
    .parse(process.argv);
