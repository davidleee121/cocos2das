package com.virtuos.cocos2das
{
	import com.virtuos.cocos2das.base.CCObject;
	
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	
	public class CCCamera extends CCObject
	{
		protected var m_fEyeX : Number;
		protected var m_fEyeY : Number;
		protected var m_fEyeZ : Number;
		
		protected var m_fCenterX : Number;
		protected var m_fCenterY : Number;
		protected var m_fCenterZ : Number;
		
		protected var m_fUpX : Number;
		protected var m_fUpY : Number;
		protected var m_fUpZ : Number;
		
		protected var m_bDirty : Boolean;
		
		public function CCCamera() 
		{
			init();
		}
		
		public function init() : void
		{
			restore();
		}
		
		public function description() : String
		{
			// action script do not have functions like 'sprintf' which is commonly used by C++ developers
			var retValue : String = "<CCCamera | center = (" + m_fCenterX + "," + m_fCenterY + "," + m_fCenterZ + ")>";
			return retValue;
		}
		
		public function setDirty(bValue : Boolean)
		{
			m_bDirty = bValue;
		}
		
		public function getDirty() : Boolean
		{
			return m_bDirty;
		}
		
		public function restore() : void
		{
			m_fEyeX = m_fEyeY = 0.0;
			m_fEyeZ = getZEye();
			
			m_fCenterX = m_fCenterY = m_fCenterZ = 0.0;
			
			m_fUpX = 0.0;
			m_fUpY = 1.0;
			m_fUpZ = 0.0;
			
			m_bDirty = false;
		}
		
		protected var viewMatrix : Matrix3D;
		
		public function get ViewMatrix() : Matrix3D
		{
			return viewMatrix;
		}
		
		public function set ViewMatrix(value : Matrix3D) : void
		{
			viewMatrix = value;
		}
		
		public function locate() : void
		{
			// can not find gluLookAt function in Stage3D, so here, we calculate out the view matrix
			// code ported from null desgin's nd2d
			
			
			
			if (m_bDirty)
			{
				var forward : Vector3D = new Vector3D();
				forward.x = m_fCenterX - m_fEyeX;
				forward.y = m_fCenterY - m_fEyeY;
				forward.z = m_fCenterZ - m_fEyeZ;
				forward.normalize();
				
				var up : Vector3D = new Vector3D();
				up.x = m_fUpX;
				up.y = m_fUpY;
				up.z = m_fUpZ;
				
				var right : Vector3D = up.crossProduct(forward);
				right.normalize();
				
				var rawData : Vector.<Number> = new Vector.<Number>();
				rawData.push(-right.x, -right.y, -right.z, 0,
							up.x, up.y, up.z, 0,
							-forward.x, -forward.y, -forward.z, 0,
							0, 0, 0, 1);
				
				viewMatrix = new Matrix3D(rawData);
				viewMatrix.prependTranslation(-m_fCenterX, -m_fCenterY, -m_fCenterZ);
			}
		}
		
		public function getZEye() : Number
		{
			return Number.MIN_VALUE;
		}
		
		void function setEyeXYZ(fEyeX : Number, fEyeY : Number, fEyeZ : Number) : void
		{
			m_fEyeX = fEyeX * CCDirector.sharedDirector().ContentScaleFactor;
			m_fEyeY = fEyeY * CCDirector.sharedDirector().ContentScaleFactor;
			m_fEyeZ = fEyeZ * CCDirector.sharedDirector().ContentScaleFactor;
			
			m_bDirty = true;
		}
		
		
	}
}
