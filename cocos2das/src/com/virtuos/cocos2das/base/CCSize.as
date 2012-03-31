package com.virtuos.cocos2das.base
{
	import com.virtuos.cocos2das.util.Assert;
	
	public class CCSize
	{
		public var width : Number;
		public var height : Number;
		
		public function CCSize(width : Number = 0, height : Number = 0)
		{
			this.width = width;
			this.height = height;
		}
		
		public static function CCSizeEqualToSize(size1 : CCSize, size2 : CCSize) : Boolean
		{
			Assert.assertCommon((size1 != null) && (size2 != null));
			
			if (size1 == null || size2 == null)
			{
				return false;
			}
			else
			{
				return ((size1.width == size2.width) && (size1.height == size2.height));
			}
		}
		
		public static const CCSizeZero : CCSize = new CCSize(0, 0);
	}
}

