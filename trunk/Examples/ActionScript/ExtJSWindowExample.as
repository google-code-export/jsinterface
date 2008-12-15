package{
	import aw.external.*;
	import aw.external.jsinterface.*;
	
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.setTimeout;

	public class ExtJSWindowExample extends Sprite{
		static public const EXTJS_LIST:Array = ["ExtJS/ext-base.js", "ExtJS/ext-all.js", "ExtJS/SessionProvider.js", "ExtJS/examples.js"];
		public var extJSIndex:int = 0;
		public var button:SimpleButton;
		protected var loadComplete:Boolean = false;
		public function ExtJSWindowExample():void{
			super();
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			JSInterface.initialize(this);
			resizeFlash();
			loadExtJS();
		}
		/** Button drawing
		 * 
		 */
		protected function addButton():void{
			this.button = new SimpleButton();
			this.button.upState = this.getButtonState(0xffffff, 0x999999);
			this.button.overState = this.getButtonState(0xeeeeee, 0x999999);
			this.button.downState = this.getButtonState(0x666666, 0xffffff);
			this.button.hitTestState = this.button.upState;
			this.button.addEventListener(MouseEvent.CLICK, this.buttonClickHandler);
			this.button.x = this.button.y = 20;
			this.addChild(button);
		}
		/** Button drawing
		 * 
		 */
		protected function getButtonState(col1:Number, col2:Number):DisplayObject{
			var sprite:Sprite = new Sprite();
			var g:Graphics = sprite.graphics;
			g.beginFill(col1, 1);
			g.lineStyle(1, col2, 1, true);
			g.drawRoundRect(0, 0, 200, 30, 10, 10);
			g.endFill();
			var tx:TextField = new TextField();
			tx.width = 200;
			tx.height = 20;
			tx.text = 'Window button';
			var tf:TextFormat = new TextFormat('Verdana', 14, 0, false, false, false, null, null, TextFormatAlign.CENTER);
			tx.setTextFormat(tf);
			tx.y = 5;
			sprite.addChild(tx);
			return sprite;
		}
		/** Resizes flash area
		 * 
		 */
		protected function resizeFlash():void{
			var main:JSDynamic = JSInterface.main;
			main.width = 250;
			main.height = 80;
		}
		/** Load all files from ExtJS Example
		 * 
		 */
		protected function loadExtJS():void{
			//------ load CSS
			JSInterface.loadCSS('ExtJS/ext-all.css');
			JSInterface.loadCSS('ExtJS/examples.css');
			//------ load JavaScript
			this.loadJavaScript();
		}
		
		/** Verify is JavaScript files loaded completely
		 * 
		 */
		protected function loadJavaScript(event:JSDynamic=null):void{
			if(this.extJSIndex>=EXTJS_LIST.length){
				var jsd:JSDynamic = JSCore.getInstance('Ext') as JSDynamic;
				if(!jsd || !jsd.isReady){
					jsd.onReady(this.completeLoadHandler);
					/*	FireFox patch	*/
					setTimeout(this.verifyComplete, 1000);
				}else{
					this.completeLoadHandler();
				}
			}else{
				JSInterface.loadJavaScript(EXTJS_LIST[this.extJSIndex], this.loadJavaScript);
				this.extJSIndex++;
			}
		}
		/** Verify JavaScript files on timeout
		 * 
		 */
		protected function verifyComplete():void{
			if(!this.loadComplete){
				this.completeLoadHandler();
			}
		}
		/** Code ported from original ExtJS example "window", file "layout.js"
		*  
		*/
		protected function completeLoadHandler():void{
			this.addButton();
			this.loadComplete = true;
			var manager:JSDynamic = JSCore.getInstance('Ext.state.Manager') as JSDynamic;
			var session:JSDynamic = new JSDynamic('Ext.state.SessionProvider', {state: null});
			manager.setProvider(session);
		}
		/** Button.onClick code
		*  
		*/
		protected function buttonClickHandler(e:MouseEvent):void{
			var markup:JSDynamic = JSCore.getInstance('Ext.example.bogusMarkup') as JSDynamic;
			// tabs for the center
			var tabs:JSDynamic = new JSDynamic('Ext.TabPanel', {region:'center', margins:'3 3 3 0', activeTab:0, defaults:
			{autoScroll:true}, 
			items:[
				{title:'Bogus Tab', html:markup},
				{title:'Another Tab', html:markup},
				{title:'Closable Tab', html:markup, closable:true}
			]});
			// Panel for the west
			var nav:JSDynamic = new JSDynamic('Ext.Panel', {
				title       : 'Navigation',
				region      : 'west',
				split       : true,
				width       : 200,
				collapsible : true,
				margins     : '3 0 3 3',
				cmargins    : '3 3 3 3'
			});
			var win:JSDynamic = new JSDynamic('Ext.Window', {
				title    : 'Layout Window',
				closable : true,
				width    : 600,
				height   : 350,
				plain    : true,
				layout   : 'border',
				items    : [nav, tabs]
			});
			win.show(null);
		}
	}
}