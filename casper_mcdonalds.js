phantom.casperPath = '/bat/casper/node_modules/casperjs';
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
casper.start('http://mcdonalds.dev', function(){
		var utils = require('utils');
		var button = this.getElementInfo('#connect');
		this.echo(button);
		this.echo('clicking on the x y coords');
		utils.dump(button);
		this.echo("clicking button");
		//this.click(button);
		this.mouse.click(button.x,button.y);
});
casper.then(function step1()
{
	this.capture('success.png');
});

casper.run(); 