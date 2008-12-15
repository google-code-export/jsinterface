function flash(name, target){
	var className = name.substr(name.lastIndexOf('.')+1);
	var classObj = eval(name);
	if(target){
		target[className] = classObj;
	}else{
		window[className] = classObj;
	};
};
flash.display = {};
flash.events = {};
flash.geom = {};
flash.text = {};
flash.utils = {};
flash.setJSIName = function(n){
	if(!n) n = JSI.first.name;
	this.__name__ = n;
};
flash.getJSIName = function(){
	if(!this.__name__) this.setJSIName();
	n = this.__name__;
	return n;
};
//============================================= flash.display.GradientType
flash.display.GradientType = {
	LINEAR:'linear',
	RADIAL:'radial'
};
//============================================= flash.display.Graphics
flash.display.Graphics = function(proto){
	this.__flobj__ = proto;
};
flash.display.Graphics.prototype.beginFill = function(color, alpha){
	this.__flobj__.call('beginFill', arguments);
};
flash.display.Graphics.prototype.beginGradientFill = function(type, colors, alphas, ratios, matrix, spreadMethod, interpolationMethod, focalPointRatio){
	if(colors && colors instanceof Array) colors = new FLSimple(colors);
	if(alphas && alphas instanceof Array) alphas = new FLSimple(alphas);
	if(ratios && ratios instanceof Array) ratios = new FLSimple(ratios);
	if(matrix && '__flobj__' in matrix) matrix = matrix.__flobj__;
	this.__flobj__.call('beginGradientFill', arguments);
};
flash.display.Graphics.prototype.lineStyle = function(thickness, color, alpha, pixelHinting, scaleMode, caps, joints, miterLimit){
	this.__flobj__.call('lineStyle', arguments);
};
flash.display.Graphics.prototype.drawRect = function(x, y, width, height){
	this.__flobj__.call('drawRect', arguments);
};
flash.display.Graphics.prototype.drawRoundRect = function(x, y, width, height, ellipseWidth, ellipseHeight){
	this.__flobj__.call('drawRoundRect', arguments);
};
flash.display.Graphics.prototype.endFill = function(){
	this.__flobj__.call('endFill', arguments);
};
flash.display.Graphics.prototype.clear = function(){
	this.__flobj__.call('clear', arguments);
};
//============================================= flash.display.SimpleButton
flash.display.SimpleButton = function(proto, n){
	if(!proto) proto = flash.display.SimpleButton.createFLObject(n);
	this.__flobj__ = proto;
};
flash.display.SimpleButton.create = function(n){
	return new flash.display.SimpleButton(flash.display.SimpleButton.createFLObject(n));
};
flash.display.SimpleButton.createFLObject = function(n){
	if(!n) n = flash.getJSIName();
	return FLObject.create('flash.display.SimpleButton', [], n);
};
flash.display.SimpleButton.prototype.addEventListener = function(type, listener, useCapture, priority, useWeakReference){
	this.__flobj__.call('addEventListener', arguments);
};
flash.display.SimpleButton.prototype.removeEventListener = function(type, listener, useCapture){
	this.__flobj__.call('removeEventListener', arguments);
};
flash.display.SimpleButton.prototype.upState = function(v){
	if(arguments.length){
		if('__flobj__' in v) v = v.__flobj__;
		this.__flobj__.set('upState', v);
	}else{
		return this.__flobj__.get('upState');
	};
};
flash.display.SimpleButton.prototype.overState = function(v){
	if(arguments.length){
		if('__flobj__' in v) v = v.__flobj__;
		this.__flobj__.set('overState', v);
	}else{
		return this.__flobj__.get('overState');
	};
};
flash.display.SimpleButton.prototype.downState = function(v){
	if(arguments.length){
		if('__flobj__' in v) v = v.__flobj__;
		this.__flobj__.set('downState', v);
	}else{
		return this.__flobj__.get('downState');
	};
};
flash.display.SimpleButton.prototype.hitTestState = function(v){
	if(arguments.length){
		if('__flobj__' in v) v = v.__flobj__;
		this.__flobj__.set('hitTestState', v);
	}else{
		return this.__flobj__.get('hitTestState');
	};
};
flash.display.SimpleButton.prototype.x = function(v){
	if(arguments.length){
		this.__flobj__.set('x', v);
	}else{
		return this.__flobj__.get('x');
	};
};
flash.display.SimpleButton.prototype.y = function(v){
	if(arguments.length){
		this.__flobj__.set('y', v);
	}else{
		return this.__flobj__.get('y');
	};
};
flash.display.SimpleButton.prototype.height = function(v){
	if(arguments.length){
		this.__flobj__.set('height', v);
	}else{
		return this.__flobj__.get('height');
	};
};
flash.display.SimpleButton.prototype.width = function(v){
	if(arguments.length){
		this.__flobj__.set('width', v);
	}else{
		return this.__flobj__.get('width');
	};
};
//============================================= flash.display.Sprite
flash.display.Sprite = function(proto, n){
	if(!proto) proto = flash.display.Sprite.createFLObject(n);
	this.__flobj__ = proto;
};
flash.display.Sprite.create = function(n){
	return new flash.display.Sprite(flash.display.Sprite.createFLObject(n));
};
flash.display.Sprite.createFLObject = function(n){
	if(!n) n = flash.getJSIName();
	return FLObject.create('flash.display.Sprite', [], n);
};
flash.display.Sprite.prototype.addChild = function(displayObject){
	if('__flobj__' in displayObject) displayObject = displayObject.__flobj__;
	if(!(displayObject instanceof FLObject)) throw new Error('Sprite.addChild accept DisplayObjects only');
	return this.__flobj__.call('addChild', arguments);
};
flash.display.Sprite.prototype.addChildAt = function(displayObject, index){
	if('__flobj__' in displayObject) displayObject = displayObject.__flobj__;
	if(!(displayObject instanceof FLObject)) throw new Error('Sprite.addChildAt accept DisplayObjects only');
	return this.__flobj__.call('addChildAt', arguments);
};
flash.display.Sprite.prototype.graphics = function(){
	return new flash.display.Graphics(this.__flobj__.get('graphics'));
};
flash.display.Sprite.prototype.x = function(v){
	if(arguments.length){
		this.__flobj__.set('x', v);
	}else{
		return this.__flobj__.get('x');
	};
};
flash.display.Sprite.prototype.y = function(v){
	if(arguments.length){
		this.__flobj__.set('y', v);
	}else{
		return this.__flobj__.get('y');
	};
};
flash.display.Sprite.prototype.height = function(v){
	if(arguments.length){
		this.__flobj__.set('height', v);
	}else{
		return this.__flobj__.get('height');
	};
};
flash.display.Sprite.prototype.width = function(v){
	if(arguments.length){
		this.__flobj__.set('width', v);
	}else{
		return this.__flobj__.get('width');
	};
};
//============================================= flash.text.TextField
flash.text.TextField = function(proto, n){
	if(!proto) proto = flash.text.TextField.createFLObject(n);
	this.__flobj__ = proto;
};
flash.text.TextField.create = function(n){
	return new flash.text.TextField(flash.text.TextField.createFLObject(n));
};
flash.text.TextField.createFLObject = function(n){
	if(!n) n = flash.getJSIName();
	return FLObject.create('flash.text.TextField',[], n);
};
flash.text.TextField.prototype.text = function(v){
	if(arguments.length){
		this.__flobj__.set('text', v);
	}else{
		return this.__flobj__.get('text');
	};
};
flash.text.TextField.prototype.htmlText = function(v){
	if(arguments.length){
		this.__flobj__.set('htmlText', v);
	}else{
		return this.__flobj__.get('htmlText');
	};
};
flash.text.TextField.prototype.x = function(v){
	if(arguments.length){
		this.__flobj__.set('x', v);
	}else{
		return this.__flobj__.get('x');
	};
};
flash.text.TextField.prototype.y = function(v){
	if(arguments.length){
		this.__flobj__.set('y', v);
	}else{
		return this.__flobj__.get('y');
	};
};
flash.text.TextField.prototype.height = function(v){
	if(arguments.length){
		this.__flobj__.set('height', v);
	}else{
		return this.__flobj__.get('height');
	};
};
flash.text.TextField.prototype.width = function(v){
	if(arguments.length){
		this.__flobj__.set('width', v);
	}else{
		return this.__flobj__.get('width');
	};
};
//============================================= flash.geom.Matrix
flash.geom.Matrix = function(proto, n){
	if(!proto) proto = flash.geom.Matrix.createFLObject(n);
	this.__flobj__ = proto;
};
flash.geom.Matrix.create = function(n){
	return new flash.geom.Matrix(flash.geom.Matrix.createFLObject(n));
};
flash.geom.Matrix.createFLObject = function(n){
	if(!n) n = flash.getJSIName();
	return FLObject.create('flash.geom.Matrix', [], n);
};
flash.geom.Matrix.prototype.a = function(v){
	if(arguments.length){
		this.__flobj__.set('a', v);
	}else{
		return this.__flobj__.get('a');
	};
};
flash.geom.Matrix.prototype.b = function(v){
	if(arguments.length){
		this.__flobj__.set('b', v);
	}else{
		return this.__flobj__.get('b');
	};
};
flash.geom.Matrix.prototype.c = function(v){
	if(arguments.length){
		this.__flobj__.set('c', v);
	}else{
		return this.__flobj__.get('c');
	};
};
flash.geom.Matrix.prototype.d = function(v){
	if(arguments.length){
		this.__flobj__.set('d', v);
	}else{
		return this.__flobj__.get('d');
	};
};
flash.geom.Matrix.prototype.tx = function(v){
	if(arguments.length){
		this.__flobj__.set('tx', v);
	}else{
		return this.__flobj__.get('tx');
	};
};
flash.geom.Matrix.prototype.ty = function(v){
	if(arguments.length){
		this.__flobj__.set('ty', v);
	}else{
		return this.__flobj__.get('ty');
	};
};
flash.geom.Matrix.prototype.createGradientBox = function(width, height, rotation, tx, ty){
	this.__flobj__.call('createGradientBox', arguments);
};