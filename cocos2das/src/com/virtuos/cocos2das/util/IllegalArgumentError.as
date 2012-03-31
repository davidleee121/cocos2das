package com.virtuos.cocos2das.util
{
	/**
	 * Thrown to indicate that a method has been passed an illegal or
	 * inappropriate argument.
	 */
	public class IllegalArgumentError extends Error
	{
		/**
		 * Constructs a new <code>IllegalArgumentError</code>.
		 *
		 * @param message the detail message that describes the cause of the error
		 */
		public function IllegalArgumentError(message : String = "")
		{
			super(message);
		}
	}
}
