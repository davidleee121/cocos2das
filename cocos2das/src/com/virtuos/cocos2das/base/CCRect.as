package com.virtuos.cocos2das.base
{
	import com.virtuos.cocos2das.util.Assert;
	
	public class CCRect
	{
		public var origin : CCPoint;
		public var size : CCSize;
		
		public function CCRect(x : Number = 0, y : Number = 0, width : Number = 0, height : Number = 0)
		{
			Assert.assertCommon(width >= 0 && height >=0);
			
			origin.x = x;
			origin.y = y;
			
			size.width = width;
			size.height = height;
		}
		
		public static function CCRectEqualToRect(rect1 : CCRect, rect2 : CCRect) : Boolean
		{
			return (CCPoint.CCPointEqualToPoint(rect1.origin, rect2.origin)
				&& CCSize.CCSizeEqualToSize(rect1.size, rect2.size));
		}
		
		public static function CCRectGetMaxX(rect : CCRect) : Number
		{
			return rect.origin.x + rect.size.width;
		}
		
		public static function CCRectGetMidX(rect : CCRect) : Number
		{
			return (rect.origin.x + rect.size.width / 2.0);
		}
		
		public static function CCRectGetMinX(rect : CCRect) : Number
		{
			return rect.origin.x;
		}
		
		public static function CCRectGetMaxY(rect : CCRect) : Number
		{
			return rect.origin.y + rect.size.height;
		}
		
		public static function CCRectGetMidY(rect : CCRect) : Number
		{
			return (rect.origin.y + rect.size.height / 2.0);
		}
		
		public static function CCRectGetMinY(rect : CCRect) : Number
		{
			return rect.origin.y;
		}
		
		public static function CCRectContainsPoint(rect : CCRect, point : CCPoint) : Boolean
		{
			var bRet : Boolean = false;
			
			if (point.x >= CCRectGetMinX(rect) && point.x <= CCRectGetMaxX(rect)
				&& point.y >= CCRectGetMinY(rect) && point.y <= CCRectGetMaxY(rect))
			{
				bRet = true;
			}
			
			return bRet;
		}
		
		public static function CCRectIntersectsRect(rectA : CCRect, rectB : CCRect) : Boolean
		{
			return !(CCRectGetMaxX(rectA) < CCRectGetMinX(rectB) ||
					CCRectGetMaxX(rectB) < CCRectGetMinX(rectA) ||
					CCRectGetMaxY(rectA) < CCRectGetMinY(rectB) ||
					CCRectGetMaxY(rectB) < CCRectGetMinY(rectA));
		}
		
		public const CCRectZero : CCRect = new CCRect(0, 0, 0, 0);
	}
}
