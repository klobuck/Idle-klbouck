extends Node

var music_changer = 0
var visibility = 0
var master_bus = AudioServer.get_bus_index("Master")

func _process(_delta):
	if music_changer == 0:
		%gs1.play()
		%gs2.stop()
		%now_playing.text = str("Now playing InkBD-song-1")
		music_changer += 1
		%change_music_button.text = str("Change music")
	if music_changer == 2:
		%gs2.play()
		%gs1.stop()
		%now_playing.text = str("Now playing Kapy-song-1")
		music_changer += 1
	if music_changer == 10:
		%gs1.stop()
		%gs2.stop()
	if music_changer >= 4 and !music_changer == 10 :
		music_changer = 0
	if music_changer == 10:
		%now_playing.text = str("")
		%change_music_button.text = str("Enable music")

func button_visiblity():
	if visibility == 1:
		%change_music_button.visible = true
		%disable_music_button.visible = true
	else:
		%change_music_button.visible = false
		%disable_music_button.visible = false
		visibility = 0

func _on_change_music_button_pressed():
	music_changer += 1

func _on_music_menu_button_pressed():
	visibility += 1
	button_visiblity()

func _on_disable_music_pressed():
	music_changer = 10

func _on_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus, value)
	if value == -30:
		AudioServer.set_bus_mute(master_bus,true)
	else:
		AudioServer.set_bus_mute(master_bus,false)
