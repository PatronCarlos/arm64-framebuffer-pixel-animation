.include "rectangle.s"
.include "circle.s"
.include "castle.s"
.include "knight.s"
.include "background.s"

paint_main_layer:
	bl paint_background
	bl paint_knight
	bl paint_castle
	
	ret
