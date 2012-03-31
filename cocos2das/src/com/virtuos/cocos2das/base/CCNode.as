package com.virtuos.cocos2das.base
{
	public class CCNode extends CCObject implements SelectorProtocol
	{
		public static const kCCNodeTagInvalid : Number = -1;
		
		protected var m_nZOrder : int;
		
		public function get ZOrder() : int
		{
			return m_nZOrder;
		}
		
		protected var m_fVertexZ : Number;
		
		public function get VertexZ() : Number
		{
			return m_fVertexZ;
		}
		
		public function set VertexZ(value : Number) : void
		{
			m_fVertexZ = value;
		}
		
		public function CCNode()
		{
		}
		
		public function update(dt : Number) : void
		{
			
		}
	}
}