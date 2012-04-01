package com.virtuos.cocos2das.base
{
	import com.virtuos.cocos2das.util.Assert;
	
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
		
		protected var m_fRotation : Number;
		
		public function get Rotation() : Number
		{
			return m_fRotation;
		}
		
		public function set Rotation(value : Number) : void
		{
			m_fRotation = value;
		}
		
		protected var m_fScaleX : Number;
		protected var m_fScaleY : Number;
		
		public function getScale() : Number
		{
			Assert.assertCommon(m_fScaleX == m_fScaleY, "CCNode#scale. ScaleX != ScaleY. Don't know which one to return");
			return m_fScaleX;
		}
		
		public function setScale(scale : Number) : void
		{
			m_fScaleX = m_fScaleY = scale;
			m_bIsTransformDirty = m_bIsInverseDirty = true;
			m_bIsTransformGLDirty = true;
		}
		
		public function get ScaleX() : Number
		{
			return m_fScaleX;
		}
		
		public function set ScaleX(value : Number) : void
		{
			m_fScaleX = value;
		}
		
		public function get ScaleY() : Number
		{
			return m_fScaleY;
		}
		
		public function set ScaleY(value : Number) : void
		{
			m_fScaleY = value;
		}
		
		protected var m_tPosition : CCPoint = new CCPoint();
		
		public function get Position() : CCPoint
		{
			return m_tPosition;
		}
		
		public function set Position(value : CCPoint) : void
		{
			m_tPosition = value;
		}
		
		protected var m_tPositionInPixels : CCPoint = new CCPoint();
		
		public function get PositionInPixels() : CCPoint
		{
			return m_tPositionInPixels;
		}
		
		public function set PositionInPixels(value : CCPoint) : void
		{
			m_tPositionInPixels = value;
		}
		
		protected var m_fSkewX : Number;
		
		
		
		public function CCNode()
		{
		}
		
		public function update(dt : Number) : void
		{
			
		}
		
		// To reduce memory, place bools that are not properties here:
		protected var m_bIsTransformDirty : Boolean;
		protected var m_bIsInverseDirty : Boolean;
		protected var m_bIsTransformGLDirty : Boolean;
	}
}