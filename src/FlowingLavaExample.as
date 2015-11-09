package
{
	/*
	
		An example demonstrating an effect acheivable with an animated UV vertex shader.
		
		Assets used with kind permission of Tomislav Podhraški. Original tutorial here
		http://gamedev.tutsplus.com/tutorials/implementation/create-a-glowing-flowing-lava-river-using-bezier-curves-and-shaders/
		
	*/
	
	import starling.display.Image;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.display.materials.StandardMaterial;
	import starling.display.shaders.fragment.TextureFragmentShader;
	import starling.display.shaders.vertex.AnimateUVVertexShader;
	import starling.events.Event;
	import starling.textures.Texture;
	
	[SWF( width="600", height="400", frameRate="60" )]
	public class FlowingLavaExample extends Sprite
	{
		[Embed( source = "/assets/BanksTiled.png" )]
		private var BanksTiledBMP		:Class;
		[Embed( source = "/assets/FinalBackground.png" )]
		private var FinalBackgroundBMP		:Class;
		[Embed( source = "/assets/FinalRock.png" )]
		private var FinalRockBMP		:Class;
		[Embed( source = "/assets/LavaTiled.png" )]
		private var LavaTiledBMP		:Class;
		[Embed( source = "/assets/LavaTiledArrows.png" )]
		private var LavaTiledArrowsBMP		:Class;
		[Embed( source = "/assets/LavaTiledArrowsReverse.png" )]
		private var LavaTiledArrowsReverseBMP		:Class;
		[Embed( source = "/assets/GlowTiled.png" )]
		private var GlowTiledBMP		:Class;
		
		public function FlowingLavaExample()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded ( e:Event ):void
		{
			// Some styles
			var lavaThickness:Number = 90 * 0.5;
			var bankThickness:Number = lavaThickness*2.2;
			
			var background:Image = new Image(Texture.fromBitmap(new FinalBackgroundBMP()));
			background.width = stage.stageWidth;
			background.height = stage.stageHeight;
			addChild(background);
			
			
			// To
			var route:Shape = new Shape();
			addChild(route);
			
			var lavaMaterial:StandardMaterial = new StandardMaterial(  );
			lavaMaterial.alpha = 0.5;
			lavaMaterial.vertexShader = new AnimateUVVertexShader( -0.1, 0 );
			lavaMaterial.fragmentShader = new TextureFragmentShader();
			lavaMaterial.textures[0] = Texture.fromBitmap( new LavaTiledArrowsReverseBMP(), false );
			route.graphics.lineMaterial( lavaThickness, lavaMaterial );
			route.graphics.moveTo( 150, 0 );
			route.graphics.curveTo( 500, 100, 500, 300 );
			route.graphics.curveTo( 500, 500, 700, 650 );
			
			var banksTexture:Texture = Texture.fromBitmap( new BanksTiledBMP(), false );
			route.graphics.lineTexture( bankThickness, banksTexture );
			route.graphics.moveTo( 150, 0 );
			route.graphics.curveTo( 500, 100, 500, 300 );
			route.graphics.curveTo( 500, 500, 700, 650 );
			route.graphics.lineStyle(0);
			
			
			
			// Back
			var routeBack:Shape = new Shape();
			//routeBack.y = 50;
			addChild(routeBack);
			
			var lavaMaterialBack:StandardMaterial = new StandardMaterial(  );
			lavaMaterialBack.vertexShader = new AnimateUVVertexShader( 0.1, 0 );
			lavaMaterialBack.fragmentShader = new TextureFragmentShader();
			lavaMaterialBack.textures[0] = Texture.fromBitmap( new LavaTiledArrowsBMP(), false );
			routeBack.graphics.lineMaterial( lavaThickness, lavaMaterialBack );
			routeBack.graphics.moveTo( 150, 100 );
			routeBack.graphics.curveTo( 500, 200, 400, 400 );
			routeBack.graphics.curveTo( 500, 600, 700, 750 );
			
			var banksTextureBack:Texture = Texture.fromBitmap( new BanksTiledBMP(), false );
			routeBack.graphics.lineTexture( bankThickness, banksTextureBack );
			routeBack.graphics.moveTo( 150, 100 );
			routeBack.graphics.curveTo( 500, 200, 400, 400 );
			routeBack.graphics.curveTo( 500, 600, 700, 750 );
			routeBack.graphics.lineStyle(0);
			
			
			
			
			//var foreground:Image = new Image(Texture.fromBitmap(new FinalRockBMP()));
			//foreground.width = stage.stageWidth;
			//foreground.height = stage.stageHeight*1.6;
			//addChild(foreground);
		}
	}
}