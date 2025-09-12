extends Panel

@onready var item_vis: Sprite2D = $CenterContainer/Panel/item_display
@onready var amount_text: Label = $CenterContainer/Panel/Label


func update(slot: InvSlot):
	if !slot.item:
		item_vis.visible = false
		amount_text.visible = false
	else:
		item_vis.visible = true
		item_vis.texture = slot.item.texture
		amount_text.visible = true
		amount_text.text = str(slot.amount)
