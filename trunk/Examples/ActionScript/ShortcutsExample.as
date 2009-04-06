package{
	import aw.external.JSInterface;
	
	import flash.display.Sprite;
	
	public class ShortcutsExample extends Sprite{
		JSInterface.initialize();
		public function ShortcutsExample():void{
			super();
			JSInterface.setTitle("My title");
			trace("Title:", JSInterface.getTitle());
			JSInterface.setStatus("My status");
			trace("Status:", JSInterface.getStatus());
			JSInterface.setDefaultStatus("My default status");
			trace("DefaultStatus:", JSInterface.getDefaultStatus());
			JSInterface.setCookie("tempCookie", "temp cookie value");
			trace("Cookie:", JSInterface.getCookie("tempCookie"));
			JSInterface.setCookie("intCookie", 115);
			JSInterface.setCookie("test", false);
			trace("Cookie string:", JSInterface.getCookieString());
			trace("Location:", JSInterface.getLocation());
			JSInterface.setLocationHash("MyLocationHash/root/debug");
			trace("Location hash:", JSInterface.getLocationHash());
			trace("Top location:", JSInterface.getTopLocation());
		}

	}
}