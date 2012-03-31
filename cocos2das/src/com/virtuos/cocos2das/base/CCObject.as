package com.virtuos.cocos2das.base
{
	import com.virtuos.cocos2das.util.Assert;
	
	public class CCObject implements CCCopying
	{
		public function copyWithZone(zone : CCZone) : CCObject
		{
			Assert.assertCommon(false);			
			return null;
		}
		
		public function CCObject()
		{
			m_uID = ++uObjectCount;
		}
		
		public function copy() : CCObject
		{
			return copyWithZone(null);
		}
		
		public function isEqual(object : CCObject) : Boolean
		{
			return this == object;
		}
		
		protected var m_uID : uint;
		
		private var uObjectCount : uint = 0;
	}
}