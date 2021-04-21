extends Timer

var button : Button
export var color1 := Color.chartreuse
export var color2 := Color.aqua


func _on_SolutionHighlightingTimer_timeout():
	button.modulate = color1 if button.modulate == color2 else color2
