		itemDef
		{
			rect 0 0 640 480 4 4
			style 3
			foreColor 1 1 1 1
			background "mw2_main_background"
			decoration 
			textScale 0.55
			visible 1
		}
#ifdef DO_THE_CHICKEN_WING
		itemDef
		{
			rect -107 0 854 480
			style 3
			foreColor 1 1 1 1
			background "mw2_main_sp_image"
			decoration 
			visible 1
		}
#endif
		itemDef
		{
			rect 0 0 640 480 4 4
			style 3
			foreColor 1 1 1 0
			background "mockup_bg_glow"
			decoration 
			textScale 0.55
			exp foreColor a ( ( ( sin ( milliseconds( ) / 1500 ) + 1 ) * 0.250000 ) + 0.250000  )
			visible 1
		}
		itemDef
		{
			rect 0 0 640 480 4 4
			style 3
			foreColor 1 1 1 0
			background "mockup_bg_glow"
			decoration 
			textScale 0.55
			visible 1
			exp foreColor a ( ( ( sin ( milliseconds( ) / 480 ) + 1 ) * 0.250000 ) + 0.250000  )
		}
#ifndef DONT_DO_THE_SIDEBAR_THINGY
		itemDef
		{
			rect -64 0 280 480 1 0
			style 3
			foreColor 1 1 1 0.1
			background "gradient_fadein_fadebottom"
			decoration 
			textScale 0.55
			visible 1
		}
#endif