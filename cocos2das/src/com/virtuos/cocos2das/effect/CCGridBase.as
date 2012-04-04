package com.virtuos.cocos2das.effect
{
	import com.virtuos.cocos2das.base.CCObject;
	import com.virtuos.cocos2das.base.CCPoint;
	
	public class CCGridBase extends CCObject
	{
		protected var m_bActive : Boolean;
		
		public function get Active() : Boolean
		{
			return m_bActive;
		}
		
		public function set Active(bActive : Boolean) : void
		{
			m_bActive = bActive;
			if (!bActive)
			{
				CCDirector pDirector = CCDirector.sharedDirector();
				ccDirectorProjection proj = pDirector.getProjection();
				pDirector.setProjection(proj);
			}
		}
		
		protected var m_nReuseGrid : int;
		
		public function get ReuseGrid() : int
		{
			return m_nReuseGrid;
		}
		
		public function set ReuseGrid(nReuseGrid : int) : void
		{
			m_nReuseGrid = nReuseGrid;
		}
		
		protected var m_sGridSize : ccGridSize;
		
		public function get GridSize() : ccGridSize
		{
			return m_sGridSize;
		}
		
		public function set GridSize(gridSize : ccGridSize) : void
		{
			m_sGridSize = gridSize;
		}
		
		protected var m_obStep : CCPoint;
		
		public function get Step() : CCPoint
		{
			return m_obStep;
		}
		
		public function set Step(step : CCPOint) : void
		{
			m_obStep = step;
		}
		
		protected var m_bIsTextureFlipped : Boolean;
		
		public function get TextureFlipped() : Boolean
		{
			return m_bIsTextureFlipped;
		}
		
		public function set TextureFlipped(bFlipped : Boolean) : void
		{
			m_bIsTextureFlipped = bFlipped;
		}
		
		// action script do not support overload, so I use default parameters here
		public function initWithSize(gridSize : ccGridSize, pTexture : CCTexture2D = null, bFlipped : Boolean = false) : void
		{
			var bRet : Boolean = true;
			
			if (pTexture != null)
			{
				m_bActive = false;
				m_nReuseGrid = 0;
				m_sGridSize = gridSize;
				
				m_pTexture = pTexture;
				
				// action script have its own reference counted logic, so do not need to call retain function here
				m_bIsTextureFlipped = bFlipped;
				
				CCSize texSize = m_pTexture->getContentSizeInPixels();
				m_obStep.x = texSize.width / m_sGridSize.x;
				m_obStep.y = texSize.height / m_sGridSize.y;
				
				m_pGrabber = new CCGrabber();
				if (m_pGrabber)
				{
					m_pGrabber->grab(m_pTexture);
				}
				else
				{
					bRet = false;
				}
				
				calculateVertexPoints();
				
				return bRet;
			}
			else
			{
				CCDirector pDirector = CCDirector.sharedDirector();
				CCSize s = pDirector.WinSizeInPixels();
				
				uint POTWide = ccNextPOT((uint)s.width);
				uint pOTHigh = ccNextPOT((uint)s.height);
				
				CCTexture2DPixelFormat format = CCTexture2DPixelFormat.kCCTexture2DPixelFormat_RGBA8888;
				
				CCTexture2D pTexture = new CCTexture2D();
				
				// temp logic here
				pTexture.initWithData(null, format, POTWide, POTHigh, s);
				
				if (!pTexture)
				{
					trace("cocos2d : CCGrid: error creating texture");
					return false;
				}
				
				initWithSize(gridSize, pTexture, false);
				
				return true;
			}
		}
		
		public function beforeDraw() : void
		{
			set2DProjection();
			m_pGrabber->beforeRender(m_pTexture);
		}
		
		
	}
}