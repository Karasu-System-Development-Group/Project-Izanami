extends Node

var day = 0
var dayFunction = {
	0: func(): day_0(),
	1: func(): day_1(),
	2: func(): day_2(),
	3: func(): day_3()
}


func start_day():
	var action = dayFunction.get(self.day, func(): print("Dia não encontrado."))
	action.call()

func day_0():
	Char.canMove(false)
	var text = Letter.read_text("res://dialogues/letters/texts/welcome.txt")
	Letter.show_message(text)
	Letter.isLetterVisible = false
	await Letter.letter_closed
	DialogBox.run("Você", ["Que estranho...", "Algum vizinho deixou isso..?", "Como ele sabe as coisas que eu fiz..?", "Será que eu deveria investigar?", "Ou é melhor arrumar minhas mudanças?", ""])
	Char.canMove(true)

	
func day_1():
	var events = ["start","livingroombox","bathroomvisited"]
	var paths = {
	"livingroombox": {
		"true": "res://dialogues/letters/texts/saw_boxes.txt",
		"false": "res://dialogues/letters/texts/not_saw_boxes.txt"
	},
	"bathroomvisited": {
		"true": "res://dialogues/letters/texts/saw_bathroom.txt",
		"false": "res://dialogues/letters/texts/not_saw_bathroom.txt"
	},
	"start": {
		"true": "res://dialogues/letters/texts/start.txt",
	}
	}
	var text = Letter.build_letter(events, paths)
	Letter.isLetterVisible = false
	Letter.show_message(text)
	await Letter.letter_closed
	DialogBox.run("Você", ["Que estranho...", "Algum vizinho deixou isso..?", "Como ele sabe as coisas que eu fiz..?", "Será que eu deveria investigar?", "Ou é melhor arrumar minhas mudanças?", ""])
	Char.internalDialog(["Que estranho...", "Algum vizinho deixou isso..?", "Como ele sabe as coisas que eu fiz..?", "Será que eu deveria investigar?", "Ou é melhor arrumar minhas mudanças?", ""])

func day_2():
	match Char.checkedNeighbors.size():
		0:
			var text = Letter.read_text("res://dialogues/letters/texts/0.txt")
			Letter.show_message(text)
			Letter.isLetterVisible = false
		1:
			var text = Letter.read_text("res://dialogues/letters/texts/1.txt")
			Letter.show_message(text)
			Letter.isLetterVisible = false
		2: 
			var text = Letter.read_text("res://dialogues/letters/texts/2.txt")
			Letter.show_message(text)
			Letter.isLetterVisible = false
		3: 
			var text = Letter.read_text("res://dialogues/letters/texts/3.txt")
			Letter.show_message(text)
			Letter.isLetterVisible = false
		4: 
			var text = Letter.read_text("res://dialogues/letters/texts/4.txt")
			Letter.show_message(text)
			Letter.isLetterVisible = false
			
func day_3():
	var text = Letter.read_text("res://dialogues/letters/texts/final.txt")
	Letter.show_message(text)
	Letter.isLetterVisible = false

	await get_tree().create_timer(2.5).timeout

	var fade = $"../ColorRect"
	var tween = create_tween()
	tween.tween_property(fade, "modulate:a", 1.0, 3.0)
	var steps = $footsteps
	steps.volume_db = -25
	steps.play()

				# Enquanto escurece, passos se aproximam (volume aumenta)
	tween.parallel().tween_property(steps, "volume_db", 0, 3.0)

	await tween.finished

				# Pausa curtinha antes do grito
	await get_tree().create_timer(0.5).timeout
	steps.stop()

				# Toca o grito
	$scream.play()
	await get_tree().create_timer(4.0).timeout
	Char.visible = false
	Letter.closeLetter()
	await get_tree().create_timer(1.0).timeout
	Char.camera.enabled = false
	Char.reset()
	Letter.resetLetter()
	get_tree().change_scene_to_file("res://scenes/final/final.tscn")
	
	
	
