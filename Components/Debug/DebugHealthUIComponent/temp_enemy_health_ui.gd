extends Label
class_name DebugHealthUI

func UpdateHealthUI(newHealthAmount) -> void:
	self.text = str(newHealthAmount)
