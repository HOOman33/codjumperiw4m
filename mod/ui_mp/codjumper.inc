// making all defined buttons be placed in here for easier acess.

#define CHOICE_Y(i) ( 28 + ( i * 20 ) )
//half pixels are GREAT - well, they seem to work here
#define HR_ORIGIN(i) 0 ( CHOICE_Y(i) - 0.5 )
#define CHOICE_ORIGIN(i) -64 CHOICE_Y(i)
#define CHOICE_RECT(i) CHOICE_ORIGIN(i) 336 20 1 1
#define HR_RECT(i) HR_ORIGIN(i) 216 1 1 1

#define MENU_CHOICE_BUTTON( itemIndex, buttonName, 	textArg, actionArg) \
		itemDef \
		{ \
			name buttonName \
			rect CHOICE_RECT(itemIndex) \
			foreColor 1 1 1 1 \
			style 1 \
			background menu_button_selection_bar \
			group mw2_button \
			type 1 \
			textAlign 6 \
			textAlignX -60 \
			textScale 0.375 \
			textFont 3 \
			text textArg \
			onFocus \
			{ \
				play mouse_over; \
				setItemColor self backColor 0 0 0 1; \
				setLocalVarBool ui_menuAButton 1; \
				setLocalVarFloat ui_popupYPos 0.000000; \
			} \
			leaveFocus \
			{ \
				setItemColor self backColor 0 0 0 0.0; \
				setLocalVarBool ui_menuAButton 1; \
				setLocalVarString ui_hint_text "@NULL_EMPTY"; \
			} \
			action \
			{ \
				play mouse_click; \
				actionArg \
			} \
			visible 1 \
		}
#define HORIZONTAL_LINE(itemIndex) \
	itemDef \
		{ \
			rect HR_RECT(itemIndex) \
			style 3 \
			foreColor 1 1 1 0.65 \
			background gradient_fadein \
			decoration \
			textScale 0.55 \
			visible 1 \
		}
#define DO_THE_LOBBY_THING \
	exec "xrequirelivesignin"; \
	setdvar "systemlink" 0; \
	setdvar "splitscreen" 0; \
	setdvar "onlinegame" 1; \
	exec "exec default_xboxlive.cfg"; \
	exec "party_maxplayers 18"; \
	exec "xblive_privatematch 0"; \
	exec "xblive_rankedmatch 0"; \
	exec "xstartprivateparty"; \
	setdvar ui_mptype 0; \
	exec "xcheckezpatch"; \
	exec "exec default_xboxlive.cfg" \
	exec "exec xblive_rankedmatch 0"; \
	exec "ui_enumeratesaved"; \
	exec "xblive_privatematch 1"; \
	exec "xstartprivatematch"; \
	open menu_xboxlive_privatelobby;
