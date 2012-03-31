package com.virtuos.cocos2das.base
{
	import com.virtuos.cocos2das.util.Assert;
	
	public class CCPoint
	{
		public var x : Number;
		public var y : Number;
		
		public function CCPoint(x : Number = 0, y : Number = 0)
		{
			this.x = x;
			this.y = y;
		}
		
		public static function CCPointEqualToPoint(point1 : CCPoint, point2 : CCPoint) : Boolean
		{
			Assert.assertCommon((point1 != null) && (point2 != null));
			
			if (point1 == null || point2 == null)
			{
				return false;
			}
			else
			{
				return ((point1.x == point2.x) && (point1.y == point2.y));
			}
		}
		
		public static const CCPointZero : CCPoint = new CCPoint(0, 0);
	}
}
