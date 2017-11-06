phantom.casperPath = '/bat/casper/casper/node_modules/casperjs';
phantom.injectJs(phantom.casperPath + '/bin/bootstrap.js');

var casper = require("casper").create({
    // other options here
    viewportSize: {
        width: 1920,
        height: 1080
    }
});


// Need a  mouse elemnet

var mouse = require("mouse").create(casper);
casper.start('http://starbucks.dev', function(){
		var utils = require('utils');
		var button = this.getElementInfo('button');
		this.echo(button);
		this.echo('clicking on the x y coords');
		this.echo("clicking button");
		//this.click(button);
		this.mouse.click(button.x,button.y);
});
casper.then(function step1()
{
	casper.wait(5000, function()
	{
		this.echo("waiting for 5000 ms for starbucks");
	});
});
casper.then(function step2()
{
	this.capture('starbucks.png');
});

casper.run(); 
