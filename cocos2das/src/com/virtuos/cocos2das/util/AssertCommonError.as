package com.virtuos.cocos2das.util
{
	/**
	 * Throws to indicate a common error occured, used to port assert keyword in C++
	 */
	public class AssertCommonError extends Error
	{
		/**
		 * Constructs a new <code>AssertCommonError</code>.
		 *
		 * @param message the detail message that describes the cause of the error
		 */			
		public function AssertCommonError(message : String = "")
		{
			super(message);
		}
	}
}