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
	public class HighlightedRoadsExample extends Sprite
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
		[Embed(source = "assets/asphalt.png")]
		private var AsphaltBMP:Class;		
		[Embed(source = "assets/TiledArrows.png")]
		private var TiledArrowsBMP:Class;
		
		public function HighlightedRoadsExample()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded ( e:Event ):void
		{
			// Some styles
			var lavaThickness:Number = 90 * 1.0;
			var bankThickness:Number = lavaThickness*2.2;
			
			var background:Image = new Image(Texture.fromBitmap(new FinalBackgroundBMP()));
			background.width = stage.stageWidth;
			background.height = stage.stageHeight;
			addChild(background);
			
			
			// To
			var road:Shape = new Shape();
			addChild(road);
			
			var roadMaterial:StandardMaterial = new StandardMaterial(  );
			//lavaMaterial.alpha = 0.5;
			//lavaMaterial.vertexShader = new AnimateUVVertexShader( -0.1, 0 );
			roadMaterial.fragmentShader = new TextureFragmentShader();
			roadMaterial.textures[0] = Texture.fromBitmap( new AsphaltBMP(), false );
			road.graphics.lineMaterial( lavaThickness, roadMaterial );
			road.graphics.moveTo( 150, 0 );
			road.graphics.curveTo( 500, 100, 500, 300 );
			road.graphics.curveTo( 500, 500, 700, 650 );
			
			//var banksTexture:Texture = Texture.fromBitmap( new BanksTiledBMP(), false );
			//road.graphics.lineTexture( bankThickness, banksTexture );
			//road.graphics.moveTo( 150, 0 );
			//road.graphics.curveTo( 500, 100, 500, 300 );
			//road.graphics.curveTo( 500, 500, 700, 650 );
			//road.graphics.lineStyle(0);
			
			
			// Highlight
			
			var highlight:Shape = new Shape();
			addChild(highlight);
			
			var highlightMaterial:StandardMaterial = new StandardMaterial(  );
			highlightMaterial.alpha = 0.5;
			highlightMaterial.vertexShader = new AnimateUVVertexShader( 0.1, 0 );
			highlightMaterial.fragmentShader = new TextureFragmentShader();
			highlightMaterial.textures[0] = Texture.fromBitmap( new TiledArrowsBMP(), false );
			highlight.graphics.lineMaterial( lavaThickness * 1.00, highlightMaterial );
			highlight.graphics.moveTo( 150, 0 );
			highlight.graphics.curveTo( 500, 100, 500, 300 );
			highlight.graphics.curveTo( 500, 500, 700, 650 );
			
			
			
			var foreground:Image = new Image(Texture.fromBitmap(new FinalRockBMP()));
			foreground.width = stage.stageWidth;
			foreground.height = stage.stageHeight*1.6;
			addChild(foreground);
		}
	}
}