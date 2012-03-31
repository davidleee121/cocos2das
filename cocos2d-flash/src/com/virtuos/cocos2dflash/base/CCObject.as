package com.virtuos.cocos2dflash.base
{
	import com.virtuos.cocos2dflash.util.Assert;
	
	public class CCObject implements CCCopying
	{
		public function copyWithZone(zone : CCZone) : CCObject
		{
			Assert.assertCommon(false);			
			return null;
		}
	}
}