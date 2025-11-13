extends Control

func changeVisibility():
	$CanvasLayer.visible = !$CanvasLayer.visible

func updateName(texto):
	$CanvasLayer/Control/charName.text = texto

func updateDialog(texto):
	$CanvasLayer/Control/dialogText.text = texto
	
	

func run(nome, pensamentos):
	self.changeVisibility()
	var i = 0
	self.updateName(nome)
	for pensamento in pensamentos:
		self.updateDialog(pensamento)
		if i == pensamentos.size() - 1 :
			await get_tree().create_timer(1.0).timeout
		else:
			await get_tree().create_timer(3.0).timeout
			i+=1
	self.changeVisibility()

func _on_ready():
	self.changeVisibility()
