package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/HTMLStyleObject.html">HTMLStyleObject</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSHTMLStyleObject extends JSDynamic{
		static public const CLASS_NAME:String = 'HTMLStyleObject';
		static js_interface const BACKGROUND_PROPERTY:String = 'background';
		static js_interface const BACKGROUND_ATTACHMENT_PROPERTY:String = 'backgroundAttachment';
		static js_interface const BACKGROUND_COLOR_PROPERTY:String = 'backgroundColor';
		static js_interface const BACKGROUND_IMAGE_PROPERTY:String = 'backgroundImage';
		static js_interface const BACKGROUND_POSITION_PROPERTY:String = 'backgroundPosition';
		static js_interface const BACKGROUND_REPEAT_PROPERTY:String = 'backgroundRepeat';
		static js_interface const BORDER_PROPERTY:String = 'border';
		static js_interface const BORDER_BOTTOM_PROPERTY:String = 'borderBottom';
		static js_interface const BORDER_BOTTOM_COLOR_PROPERTY:String = 'borderBottomColor';
		static js_interface const BORDER_BOTTOM_STYLE_PROPERTY:String = 'borderBottomStyle';
		static js_interface const BORDER_BOTTOM_WIDTH_PROPERTY:String = 'borderBottomWidth';
		static js_interface const BORDER_COLLAPSE_PROPERTY:String = 'borderCollapse';
		static js_interface const BORDER_COLOR_PROPERTY:String = 'borderColor';
		static js_interface const BORDER_LEFT_PROPERTY:String = 'borderLeft';
		static js_interface const BORDER_LEFT_COLOR_PROPERTY:String = 'borderLeftColor';
		static js_interface const BORDER_LEFT_STYLE_PROPERTY:String = 'borderLeftStyle';
		static js_interface const BORDER_LEFT_WIDTH_PROPERTY:String = 'borderLeftWidth';
		static js_interface const BORDER_RIGHT_PROPERTY:String = 'borderRight';
		static js_interface const BORDER_RIGHT_COLOR_PROPERTY:String = 'borderRightColor';
		static js_interface const BORDER_RIGHT_STYLE_PROPERTY:String = 'borderRightStyle';
		static js_interface const BORDER_RIGHT_WIDTH_PROPERTY:String = 'borderRightWidth';
		static js_interface const BORDER_SPACING_PROPERTY:String = 'borderSpacing';
		static js_interface const BORDER_STYLE_PROPERTY:String = 'borderStyle';
		static js_interface const BORDER_TOP_PROPERTY:String = 'borderTop';
		static js_interface const BORDER_TOP_COLOR_PROPERTY:String = 'borderTopColor';
		static js_interface const BORDER_TOP_STYLE_PROPERTY:String = 'borderTopStyle';
		static js_interface const BORDER_TOP_WIDTH_PROPERTY:String = 'borderTopWidth';
		static js_interface const BORDER_WIDTH_PROPERTY:String = 'borderWidth';
		static js_interface const BOTTOM_PROPERTY:String = 'bottom';
		static js_interface const CAPTION_SIDE_PROPERTY:String = 'captionSide';
		static js_interface const CLEAR_PROPERTY:String = 'clear';
		static js_interface const CLIP_PROPERTY:String = 'clip';
		static js_interface const COLOR_PROPERTY:String = 'color';
		static js_interface const CONTENT_PROPERTY:String = 'content';
		static js_interface const CURSOR_PROPERTY:String = 'cursor';
		static js_interface const DIRECTION_PROPERTY:String = 'direction';
		static js_interface const DISPLAY_PROPERTY:String = 'display';
		static js_interface const EMPTY_CELLS_PROPERTY:String = 'emptyCells';
		static js_interface const FLOAT_PROPERTY:String = 'float';
		static js_interface const FONT_PROPERTY:String = 'font';
		static js_interface const FONT_FAMILY_PROPERTY:String = 'fontFamily';
		static js_interface const FONT_SIZE_PROPERTY:String = 'fontSize';
		static js_interface const FONT_STYLE_PROPERTY:String = 'fontStyle';
		static js_interface const FONT_VARIANT_PROPERTY:String = 'fontVariant';
		static js_interface const FONT_WEIGHT_PROPERTY:String = 'fontWeight';
		static js_interface const HEIGHT_PROPERTY:String = 'height';
		static js_interface const LEFT_PROPERTY:String = 'left';
		static js_interface const LETTER_SPACING_PROPERTY:String = 'letterSpacing';
		static js_interface const LINE_HEIGHT_PROPERTY:String = 'lineHeight';
		static js_interface const LIST_STYLE_PROPERTY:String = 'listStyle';
		static js_interface const LIST_STYLE_IMAGE_PROPERTY:String = 'listStyleImage';
		static js_interface const LIST_STYLE_POSITION_PROPERTY:String = 'listStylePosition';
		static js_interface const LIST_STYLE_TYPE_PROPERTY:String = 'listStyleType';
		static js_interface const MARGIN_PROPERTY:String = 'margin';
		static js_interface const MARGIN_BOTTOM_PROPERTY:String = 'marginBottom';
		static js_interface const MARGIN_LEFT_PROPERTY:String = 'marginLeft';
		static js_interface const MARGIN_RIGHT_PROPERTY:String = 'marginRight';
		static js_interface const MARGIN_TOP_PROPERTY:String = 'marginTop';
		static js_interface const MAX_HEIGHT_PROPERTY:String = 'maxHeight';
		static js_interface const MAX_WIDTH_PROPERTY:String = 'maxWidth';
		static js_interface const MIN_HEIGHT_PROPERTY:String = 'minHeight';
		static js_interface const MIN_WIDTH_PROPERTY:String = 'minWidth';
		static js_interface const OVERFLOW_PROPERTY:String = 'overflow';
		static js_interface const PADDING_PROPERTY:String = 'padding';
		static js_interface const PADDING_BOTTOM_PROPERTY:String = 'paddingBottom';
		static js_interface const PADDING_LEFT_PROPERTY:String = 'paddingLeft';
		static js_interface const PADDING_RIGHT_PROPERTY:String = 'paddingRight';
		static js_interface const PADDING_TOP_PROPERTY:String = 'paddingTop';
		static js_interface const PAGE_BREAK_AFTER_PROPERTY:String = 'pageBreakAfter';
		static js_interface const PAGE_BREAK_BEFORE_PROPERTY:String = 'pageBreakBefore';
		static js_interface const POSITION_PROPERTY:String = 'position';
		static js_interface const RIGHT_PROPERTY:String = 'right';
		static js_interface const TABLE_LAYOUT_PROPERTY:String = 'tableLayout';
		static js_interface const TEXT_ALIGN_PROPERTY:String = 'textAlign';
		static js_interface const TEXT_DECORATION_PROPERTY:String = 'textDecoration';
		static js_interface const TEXT_INDENT_PROPERTY:String = 'textIndent';
		static js_interface const TEXT_TRANSFORM_PROPERTY:String = 'textTransform';
		static js_interface const TOP_PROPERTY:String = 'top';
		static js_interface const VERTICAL_ALIGN_PROPERTY:String = 'verticalAlign';
		static js_interface const VISIBILITY_PROPERTY:String = 'visibility';
		static js_interface const WHITE_SPACE_PROPERTY:String = 'whiteSpace';
		static js_interface const WIDOWS_PROPERTY:String = 'widows';
		static js_interface const WIDTH_PROPERTY:String = 'width';
		static js_interface const WORD_SPACING_PROPERTY:String = 'wordSpacing';
		static js_interface const Z_INDEX_PROPERTY:String = 'zIndex';
		public function JSHTMLStyleObject(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function get background():String{
			return this.internalGet(js_interface::BACKGROUND_PROPERTY);
		}
		public function set background(p:String):void{
			this.internalSet(js_interface::BACKGROUND_PROPERTY, p);
		}
		public function get backgroundAttachment():String{
			return this.internalGet(js_interface::BACKGROUND_ATTACHMENT_PROPERTY);
		}
		public function set backgroundAttachment(p:String):void{
			this.internalSet(js_interface::BACKGROUND_ATTACHMENT_PROPERTY, p);
		}
		public function get backgroundColor():String{
			return this.internalGet(js_interface::BACKGROUND_COLOR_PROPERTY);
		}
		public function set backgroundColor(p:String):void{
			this.internalSet(js_interface::BACKGROUND_COLOR_PROPERTY, p);
		}
		public function get backgroundImage():String{
			return this.internalGet(js_interface::BACKGROUND_IMAGE_PROPERTY);
		}
		public function set backgroundImage(p:String):void{
			this.internalSet(js_interface::BACKGROUND_IMAGE_PROPERTY, p);
		}
		public function get backgroundPosition():String{
			return this.internalGet(js_interface::BACKGROUND_POSITION_PROPERTY);
		}
		public function set backgroundPosition(p:String):void{
			this.internalSet(js_interface::BACKGROUND_POSITION_PROPERTY, p);
		}
		public function get backgroundRepeat():String{
			return this.internalGet(js_interface::BACKGROUND_REPEAT_PROPERTY);
		}
		public function set backgroundRepeat(p:String):void{
			this.internalSet(js_interface::BACKGROUND_REPEAT_PROPERTY, p);
		}
		public function get border():String{
			return this.internalGet(js_interface::BORDER_PROPERTY);
		}
		public function set border(p:String):void{
			this.internalSet(js_interface::BORDER_PROPERTY, p);
		}
		public function get borderBottom():String{
			return this.internalGet(js_interface::BORDER_BOTTOM_PROPERTY);
		}
		public function set borderBottom(p:String):void{
			this.internalSet(js_interface::BORDER_BOTTOM_PROPERTY, p);
		}
		public function get borderBottomColor():String{
			return this.internalGet(js_interface::BORDER_BOTTOM_COLOR_PROPERTY);
		}
		public function set borderBottomColor(p:String):void{
			this.internalSet(js_interface::BORDER_BOTTOM_COLOR_PROPERTY, p);
		}
		public function get borderBottomStyle():String{
			return this.internalGet(js_interface::BORDER_BOTTOM_STYLE_PROPERTY);
		}
		public function set borderBottomStyle(p:String):void{
			this.internalSet(js_interface::BORDER_BOTTOM_STYLE_PROPERTY, p);
		}
		public function get borderBottomWidth():String{
			return this.internalGet(js_interface::BORDER_BOTTOM_WIDTH_PROPERTY);
		}
		public function set borderBottomWidth(p:String):void{
			this.internalSet(js_interface::BORDER_BOTTOM_WIDTH_PROPERTY, p);
		}
		public function get borderCollapse():String{
			return this.internalGet(js_interface::BORDER_COLLAPSE_PROPERTY);
		}
		public function set borderCollapse(p:String):void{
			this.internalSet(js_interface::BORDER_COLLAPSE_PROPERTY, p);
		}
		public function get borderColor():String{
			return this.internalGet(js_interface::BORDER_COLOR_PROPERTY);
		}
		public function set borderColor(p:String):void{
			this.internalSet(js_interface::BORDER_COLOR_PROPERTY, p);
		}
		public function get borderLeft():String{
			return this.internalGet(js_interface::BORDER_LEFT_PROPERTY);
		}
		public function set borderLeft(p:String):void{
			this.internalSet(js_interface::BORDER_LEFT_PROPERTY, p);
		}
		public function get borderLeftColor():String{
			return this.internalGet(js_interface::BORDER_LEFT_COLOR_PROPERTY);
		}
		public function set borderLeftColor(p:String):void{
			this.internalSet(js_interface::BORDER_LEFT_COLOR_PROPERTY, p);
		}
		public function get borderLeftStyle():String{
			return this.internalGet(js_interface::BORDER_LEFT_STYLE_PROPERTY);
		}
		public function set borderLeftStyle(p:String):void{
			this.internalSet(js_interface::BORDER_LEFT_STYLE_PROPERTY, p);
		}
		public function get borderLeftWidth():String{
			return this.internalGet(js_interface::BORDER_LEFT_WIDTH_PROPERTY);
		}
		public function set borderLeftWidth(p:String):void{
			this.internalSet(js_interface::BORDER_LEFT_WIDTH_PROPERTY, p);
		}
		public function get borderRight():String{
			return this.internalGet(js_interface::BORDER_RIGHT_PROPERTY);
		}
		public function set borderRight(p:String):void{
			this.internalSet(js_interface::BORDER_RIGHT_PROPERTY, p);
		}
		public function get borderRightColor():String{
			return this.internalGet(js_interface::BORDER_RIGHT_COLOR_PROPERTY);
		}
		public function set borderRightColor(p:String):void{
			this.internalSet(js_interface::BORDER_RIGHT_COLOR_PROPERTY, p);
		}
		public function get borderRightStyle():String{
			return this.internalGet(js_interface::BORDER_RIGHT_STYLE_PROPERTY);
		}
		public function set borderRightStyle(p:String):void{
			this.internalSet(js_interface::BORDER_RIGHT_STYLE_PROPERTY, p);
		}
		public function get borderRightWidth():String{
			return this.internalGet(js_interface::BORDER_RIGHT_WIDTH_PROPERTY);
		}
		public function set borderRightWidth(p:String):void{
			this.internalSet(js_interface::BORDER_RIGHT_WIDTH_PROPERTY, p);
		}
		public function get borderSpacing():String{
			return this.internalGet(js_interface::BORDER_SPACING_PROPERTY);
		}
		public function set borderSpacing(p:String):void{
			this.internalSet(js_interface::BORDER_SPACING_PROPERTY, p);
		}
		public function get borderStyle():String{
			return this.internalGet(js_interface::BORDER_STYLE_PROPERTY);
		}
		public function set borderStyle(p:String):void{
			this.internalSet(js_interface::BORDER_STYLE_PROPERTY, p);
		}
		public function get borderTop():String{
			return this.internalGet(js_interface::BORDER_TOP_PROPERTY);
		}
		public function set borderTop(p:String):void{
			this.internalSet(js_interface::BORDER_TOP_PROPERTY, p);
		}
		public function get borderTopColor():String{
			return this.internalGet(js_interface::BORDER_TOP_COLOR_PROPERTY);
		}
		public function set borderTopColor(p:String):void{
			this.internalSet(js_interface::BORDER_TOP_COLOR_PROPERTY, p);
		}
		public function get borderTopStyle():String{
			return this.internalGet(js_interface::BORDER_TOP_STYLE_PROPERTY);
		}
		public function set borderTopStyle(p:String):void{
			this.internalSet(js_interface::BORDER_TOP_STYLE_PROPERTY, p);
		}
		public function get borderTopWidth():String{
			return this.internalGet(js_interface::BORDER_TOP_WIDTH_PROPERTY);
		}
		public function set borderTopWidth(p:String):void{
			this.internalSet(js_interface::BORDER_TOP_WIDTH_PROPERTY, p);
		}
		public function get borderWidth():String{
			return this.internalGet(js_interface::BORDER_WIDTH_PROPERTY);
		}
		public function set borderWidth(p:String):void{
			this.internalSet(js_interface::BORDER_WIDTH_PROPERTY, p);
		}
		public function get bottom():String{
			return this.internalGet(js_interface::BOTTOM_PROPERTY);
		}
		public function set bottom(p:String):void{
			this.internalSet(js_interface::BOTTOM_PROPERTY, p);
		}
		public function get captionSide():String{
			return this.internalGet(js_interface::CAPTION_SIDE_PROPERTY);
		}
		public function set captionSide(p:String):void{
			this.internalSet(js_interface::CAPTION_SIDE_PROPERTY, p);
		}
		public function get clear():String{
			return this.internalGet(js_interface::CLEAR_PROPERTY);
		}
		public function set clear(p:String):void{
			this.internalSet(js_interface::CLEAR_PROPERTY, p);
		}
		public function get clip():String{
			return this.internalGet(js_interface::CLIP_PROPERTY);
		}
		public function set clip(p:String):void{
			this.internalSet(js_interface::CLIP_PROPERTY, p);
		}
		public function get color():String{
			return this.internalGet(js_interface::COLOR_PROPERTY);
		}
		public function set color(p:String):void{
			this.internalSet(js_interface::COLOR_PROPERTY, p);
		}
		public function get content():String{
			return this.internalGet(js_interface::CONTENT_PROPERTY);
		}
		public function set content(p:String):void{
			this.internalSet(js_interface::CONTENT_PROPERTY, p);
		}
		public function get cursor():String{
			return this.internalGet(js_interface::CURSOR_PROPERTY);
		}
		public function set cursor(p:String):void{
			this.internalSet(js_interface::CURSOR_PROPERTY, p);
		}
		public function get direction():String{
			return this.internalGet(js_interface::DIRECTION_PROPERTY);
		}
		public function set direction(p:String):void{
			this.internalSet(js_interface::DIRECTION_PROPERTY, p);
		}
		public function get display():String{
			return this.internalGet(js_interface::DISPLAY_PROPERTY);
		}
		public function set display(p:String):void{
			this.internalSet(js_interface::DISPLAY_PROPERTY, p);
		}
		public function get emptyCells():String{
			return this.internalGet(js_interface::EMPTY_CELLS_PROPERTY);
		}
		public function set emptyCells(p:String):void{
			this.internalSet(js_interface::emptyCells, p);
		}
		public function get float():String{
			return this.internalGet(js_interface::FLOAT_PROPERTY);
		}
		public function set float(p:String):void{
			this.internalSet(js_interface::FLOAT_PROPERTY, p);
		}
		public function get font():String{
			return this.internalGet(js_interface::FONT_PROPERTY);
		}
		public function set font(p:String):void{
			this.internalSet(js_interface::FONT_PROPERTY, p);
		}
		public function get fontFamily():String{
			return this.internalGet(js_interface::FONT_FAMILY_PROPERTY);
		}
		public function set fontFamily(p:String):void{
			this.internalSet(js_interface::FONT_FAMILY_PROPERTY, p);
		}
		public function get fontSize():String{
			return this.internalGet(js_interface::FONT_SIZE_PROPERTY);
		}
		public function set fontSize(p:String):void{
			this.internalSet(js_interface::FONT_SIZE_PROPERTY, p);
		}
		public function get fontStyle():String{
			return this.internalGet(js_interface::FONT_STYLE_PROPERTY);
		}
		public function set fontStyle(p:String):void{
			this.internalSet(js_interface::FONT_STYLE_PROPERTY, p);
		}
		public function get fontVariant():String{
			return this.internalGet(js_interface::FONT_VARIANT_PROPERTY);
		}
		public function set fontVariant(p:String):void{
			this.internalSet(js_interface::FONT_VARIANT_PROPERTY, p);
		}
		public function get fontWeight():String{
			return this.internalGet(js_interface::FONT_WEIGHT_PROPERTY);
		}
		public function set fontWeight(p:String):void{
			this.internalSet(js_interface::FONT_WEIGHT_PROPERTY, p);
		}
		public function get height():String{
			return this.internalGet(js_interface::HEIGHT_PROPERTY);
		}
		public function set height(p:String):void{
			this.internalSet(js_interface::HEIGHT_PROPERTY, p);
		}
		public function get left():String{
			return this.internalGet(js_interface::LEFT_PROPERTY);
		}
		public function set left(p:String):void{
			this.internalSet(js_interface::LEFT_PROPERTY, p);
		}
		public function get letterSpacing():String{
			return this.internalGet(js_interface::LETTER_SPACING_PROPERTY);
		}
		public function set letterSpacing(p:String):void{
			this.internalSet(js_interface::LETTER_SPACING_PROPERTY, p);
		}
		public function get lineHeight():String{
			return this.internalGet(js_interface::LINE_HEIGHT_PROPERTY);
		}
		public function set lineHeight(p:String):void{
			this.internalSet(js_interface::LINE_HEIGHT_PROPERTY, p);
		}
		public function get listStyle():String{
			return this.internalGet(js_interface::LIST_STYLE_PROPERTY);
		}
		public function set listStyle(p:String):void{
			this.internalSet(js_interface::LIST_STYLE_PROPERTY, p);
		}
		public function get listStyleImage():String{
			return this.internalGet(js_interface::LIST_STYLE_IMAGE_PROPERTY);
		}
		public function set listStyleImage(p:String):void{
			this.internalSet(js_interface::LIST_STYLE_IMAGE_PROPERTY, p);
		}
		public function get listStylePosition():String{
			return this.internalGet(js_interface::LIST_STYLE_POSITION_PROPERTY);
		}
		public function set listStylePosition(p:String):void{
			this.internalSet(js_interface::LIST_STYLE_POSITION_PROPERTY, p);
		}
		public function get listStyleType():String{
			return this.internalGet(js_interface::LIST_STYLE_TYPE_PROPERTY);
		}
		public function set listStyleType(p:String):void{
			this.internalSet(js_interface::LIST_STYLE_TYPE_PROPERTY, p);
		}
		public function get margin():String{
			return this.internalGet(js_interface::MARGIN_PROPERTY);
		}
		public function set margin(p:String):void{
			this.internalSet(js_interface::MARGIN_PROPERTY, p);
		}
		public function get marginBottom():String{
			return this.internalGet(js_interface::MARGIN_BOTTOM_PROPERTY);
		}
		public function set marginBottom(p:String):void{
			this.internalSet(js_interface::MARGIN_BOTTOM_PROPERTY, p);
		}
		public function get marginLeft():String{
			return this.internalGet(js_interface::MARGIN_LEFT_PROPERTY);
		}
		public function set marginLeft(p:String):void{
			this.internalSet(js_interface::MARGIN_LEFT_PROPERTY, p);
		}
		public function get marginRight():String{
			return this.internalGet(js_interface::MARGIN_RIGHT_PROPERTY);
		}
		public function set marginRight(p:String):void{
			this.internalSet(js_interface::MARGIN_RIGHT_PROPERTY, p);
		}
		public function get marginTop():String{
			return this.internalGet(js_interface::MARGIN_TOP_PROPERTY);
		}
		public function set marginTop(p:String):void{
			this.internalSet(js_interface::MARGIN_TOP_PROPERTY, p);
		}
		public function get maxHeight():String{
			return this.internalGet(js_interface::MAX_HEIGHT_PROPERTY);
		}
		public function set maxHeight(p:String):void{
			this.internalSet(js_interface::MAX_HEIGHT_PROPERTY, p);
		}
		public function get maxWidth():String{
			return this.internalGet(js_interface::MAX_WIDTH_PROPERTY);
		}
		public function set maxWidth(p:String):void{
			this.internalSet(js_interface::MAX_WIDTH_PROPERTY, p);
		}
		public function get minHeight():String{
			return this.internalGet(js_interface::MIN_HEIGHT_PROPERTY);
		}
		public function set minHeight(p:String):void{
			this.internalSet(js_interface::MIN_HEIGHT_PROPERTY, p);
		}
		public function get minWidth():String{
			return this.internalGet(js_interface::MIN_WIDTH_PROPERTY);
		}
		public function set minWidth(p:String):void{
			this.internalSet(js_interface::MIN_WIDTH_PROPERTY, p);
		}
		public function get overflow():String{
			return this.internalGet(js_interface::OVERFLOW_PROPERTY);
		}
		public function set overflow(p:String):void{
			this.internalSet(js_interface::OVERFLOW_PROPERTY, p);
		}
		public function get padding():String{
			return this.internalGet(js_interface::PADDING_PROPERTY);
		}
		public function set padding(p:String):void{
			this.internalSet(js_interface::PADDING_PROPERTY, p);
		}
		public function get paddingBottom():String{
			return this.internalGet(js_interface::PADDING_BOTTOM_PROPERTY);
		}
		public function set paddingBottom(p:String):void{
			this.internalSet(js_interface::PADDING_BOTTOM_PROPERTY, p);
		}
		public function get paddingLeft():String{
			return this.internalGet(js_interface::PADDING_LEFT_PROPERTY);
		}
		public function set paddingLeft(p:String):void{
			this.internalSet(js_interface::PADDING_LEFT_PROPERTY, p);
		}
		public function get paddingRight():String{
			return this.internalGet(js_interface::PADDING_RIGHT_PROPERTY);
		}
		public function set paddingRight(p:String):void{
			this.internalSet(js_interface::PADDING_RIGHT_PROPERTY, p);
		}
		public function get paddingTop():String{
			return this.internalGet(js_interface::PADDING_TOP_PROPERTY);
		}
		public function set paddingTop(p:String):void{
			this.internalSet(js_interface::PADDING_TOP_PROPERTY, p);
		}
		public function get pageBreakAfter():String{
			return this.internalGet(js_interface::PAGE_BREAK_AFTER_PROPERTY);
		}
		public function set pageBreakAfter(p:String):void{
			this.internalSet(js_interface::PAGE_BREAK_AFTER_PROPERTY, p);
		}
		public function get pageBreakBefore():String{
			return this.internalGet(js_interface::PAGE_BREAK_BEFORE_PROPERTY);
		}
		public function set pageBreakBefore(p:String):void{
			this.internalSet(js_interface::PAGE_BREAK_BEFORE_PROPERTY, p);
		}
		public function get position():String{
			return this.internalGet(js_interface::POSITION_PROPERTY);
		}
		public function set position(p:String):void{
			this.internalSet(js_interface::POSITION_PROPERTY, p);
		}
		public function get right():String{
			return this.internalGet(js_interface::RIGHT_PROPERTY);
		}
		public function set right(p:String):void{
			this.internalSet(js_interface::RIGHT_PROPERTY, p);
		}
		public function get tableLayout():String{
			return this.internalGet(js_interface::TABLE_LAYOUT_PROPERTY);
		}
		public function set tableLayout(p:String):void{
			this.internalSet(js_interface::TABLE_LAYOUT_PROPERTY, p);
		}
		public function get textAlign():String{
			return this.internalGet(js_interface::TEXT_ALIGN_PROPERTY);
		}
		public function set textAlign(p:String):void{
			this.internalSet(js_interface::TEXT_ALIGN_PROPERTY, p);
		}
		public function get textDecoration():String{
			return this.internalGet(js_interface::TEXT_DECORATION_PROPERTY);
		}
		public function set textDecoration(p:String):void{
			this.internalSet(js_interface::TEXT_DECORATION_PROPERTY, p);
		}
		public function get textIndent():String{
			return this.internalGet(js_interface::TEXT_INDENT_PROPERTY);
		}
		public function set textIndent(p:String):void{
			this.internalSet(js_interface::TEXT_INDENT_PROPERTY, p);
		}
		public function get textTransform():String{
			return this.internalGet(js_interface::TEXT_TRANSFORM_PROPERTY);
		}
		public function set textTransform(p:String):void{
			this.internalSet(js_interface::TEXT_TRANSFORM_PROPERTY, p);
		}
		public function get top():String{
			return this.internalGet(js_interface::TOP_PROPERTY);
		}
		public function set top(p:String):void{
			this.internalSet(js_interface::TOP_PROPERTY, p);
		}
		public function get verticalAlign():String{
			return this.internalGet(js_interface::VERTICAL_ALIGN_PROPERTY);
		}
		public function set verticalAlign(p:String):void{
			this.internalSet(js_interface::VERTICAL_ALIGN_PROPERTY, p);
		}
		public function get visibility():String{
			return this.internalGet(js_interface::VISIBILITY_PROPERTY);
		}
		public function set visibility(p:String):void{
			this.internalSet(js_interface::VISIBILITY_PROPERTY, p);
		}
		public function get whiteSpace():String{
			return this.internalGet(js_interface::WHITE_SPACE_PROPERTY);
		}
		public function set whiteSpace(p:String):void{
			this.internalSet(js_interface::WHITE_SPACE_PROPERTY, p);
		}
		public function get widows():Number{
			return this.internalGet(js_interface::WIDOWS_PROPERTY);
		}
		public function set widows(p:Number):void{
			this.internalSet(js_interface::WIDOWS_PROPERTY, p);
		}
		public function get width():String{
			return this.internalGet(js_interface::WIDTH_PROPERTY);
		}
		public function set width(p:String):void{
			this.internalSet(js_interface::WIDTH_PROPERTY, p);
		}
		public function get wordSpacing():String{
			return this.internalGet(js_interface::WORD_SPACING_PROPERTY);
		}
		public function set wordSpacing(p:String):void{
			this.internalSet(js_interface::WORD_SPACING_PROPERTY, p);
		}
		public function get zIndex():Number{
			return this.internalGet(js_interface::Z_INDEX_PROPERTY);
		}
		public function set zIndex(p:Number):void{
			this.internalSet(js_interface::Z_INDEX_PROPERTY, p);
		}
		static public function create(...args:Array):JSHTMLStyleObject{
			return new JSHTMLStyleObject(CLASS_NAME, args);
		}
	}
}