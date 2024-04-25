extends Node2D

var save_path = "user://data.save"
#dane
var cash = 1
var add_full 
#do klik boosta
var click_boost = 0
var click_max = 10
var needed_cash_for_clicks = 100
var needed_cash_for_time = 100
var time_between_clicks = 0.5
#do reset boosta
var requiered_for_multiplier = 10
var multiplier_count = 0
var multiplier = 0.0
#zmienne 1 tieru
var add_tier_1 = 0.00
var buy_tier_1 = 1
var bought_tier_1 = 0
var needed_for_boost_tier_1 = 10 
#zmienne 2 tieru
var add_tier_2 = 0.00
var buy_tier_2 = 100
var bought_tier_2 = 0
var needed_for_boost_tier_2 = 10

#save system
func save_data():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(cash)
	#klik boost
	file.store_var(time_between_clicks)
	file.store_var(needed_cash_for_time)
	file.store_var(click_max)
	file.store_var(needed_cash_for_clicks)
	#reset boost
	file.store_var(requiered_for_multiplier)
	file.store_var(multiplier_count)
	file.store_var(multiplier)
	#tier 1
	file.store_var(add_tier_1)
	file.store_var(buy_tier_1)
	file.store_var(bought_tier_1)
	file.store_var(needed_for_boost_tier_1)
	#tier 2
	file.store_var(add_tier_2)
	file.store_var(buy_tier_2)
	file.store_var(bought_tier_2)
	file.store_var(needed_for_boost_tier_2)
	%save_text.text = str("Data saved successfully.")

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		cash = file.get_var(cash)
		#klik boost
		time_between_clicks = file.get_var(time_between_clicks)
		needed_cash_for_time = file.get_var(needed_cash_for_time)
		click_max = file.get_var(click_max)
		needed_cash_for_clicks = file.get_var(needed_cash_for_clicks)
		#reset boost
		requiered_for_multiplier = file.get_var(requiered_for_multiplier)
		multiplier_count = file.get_var(multiplier_count)
		multiplier = file.get_var(multiplier)
		#tier 1
		add_tier_1 = file.get_var(add_tier_1)
		buy_tier_1 = file.get_var(buy_tier_1)
		bought_tier_1 = file.get_var(bought_tier_1)
		needed_for_boost_tier_1 = file.get_var(needed_for_boost_tier_1)
		#tier 2
		add_tier_2 = file.get_var(add_tier_2)
		buy_tier_2 = file.get_var(buy_tier_2)
		bought_tier_2 = file.get_var(bought_tier_2)
		needed_for_boost_tier_2 = file.get_var(needed_for_boost_tier_2)
		%load_text.text = str("Data loaded successfully.")
	else:
		%load_text.text = str("No data found press the save button and try again.")

func _on_save_button_pressed():
	save_data()
	%save_text_timer.start()

func _on_load_button_pressed():
	load_data()
	%save_text_timer.start()

func _on_delete_button_pressed():
	DirAccess.remove_absolute("user://data.save")
	%delete_text.text = str("Data deleted successfully.")
	%save_text_timer.start()

func _on_reset_button_pressed():
	cash = 1
	click_boost = 0
	requiered_for_multiplier = 10
	multiplier_count = 0
	multiplier = 0.0
	add_tier_1 = 0.00
	buy_tier_1 = 1
	bought_tier_1 = 0
	needed_for_boost_tier_1 = 10 
	add_tier_2 = 0.00
	buy_tier_2 = 100
	bought_tier_2 = 0
	needed_for_boost_tier_2 = 10
	%reset_text.text = str("Data reseted successfully.")

func _on_save_text_timer_timeout():
	%save_text.text = str("")
	%load_text.text = str("")
	%delete_text.text = str("")
	%reset_text.text = str("")

#kod od gry
func _process(delta):
	#money
	add_full = add_tier_1 + add_tier_2
	cash += add_full
	#pokazywane wartości
	%cash.text = str("Ink: ", snapped(cash, 0.01))
	#tier 1
	%buy_tier_1.text = str("Cost: ", snapped(buy_tier_1, 0.01))
	%add_tier_1.text = str("Production: ", snapped(add_tier_1, 0.01))
	%amount_tier_1.text = str("Amount: ", bought_tier_1)
	%needed_for_boost_tier_1.text = str("Needed for boost: ", needed_for_boost_tier_1)
	#tier 2
	%buy_tier_2.text = str("Cost: ", snapped(buy_tier_2, 0.01))
	%add_tier_2.text = str("Production: ", snapped(add_tier_2, 0.01))
	%amount_tier_2.text = str("Amount: ", bought_tier_2)
	%needed_for_boost_tier_2.text = str("Needed for boost: ", needed_for_boost_tier_2)
	#reset boost
	%count.text = str("Amount: ", multiplier_count)
	%requirements.text = str("Requierd amount of tier 2: ", requiered_for_multiplier)
	%multiplier.text = str("Multiplier: ", multiplier)
	%needed_for_another_tier.text = str("Needed for another tier: ")
	#klik boost
	%clicks.text = str("Click boost: ", click_boost)
	%more_clicks_text.text = str("Cost for more clicks: ", needed_cash_for_clicks, "\n Amount of clicks: ",click_max )
	%more_time_text.text = str("Cost for more time: ", needed_cash_for_time, "\n Time between: ", time_between_clicks)
	if %click_boost_timer.time_left == 0 and click_boost > 0:
		click_boost -= 1
		%click_boost_timer.start()
	if click_boost >= click_max:
		click_boost = click_max
	if click_boost>0:
		add_full *= 1.0 + (click_boost/10.0)
	print(add_full)
	%add_full.text = str("Ink you produce: ", snapped(add_full, 0.01))

#tiery
func _on_tier_1_pressed():
	#jak za mało kasy to nie kupisz
	if cash >= buy_tier_1:
		add_tier_1 += 0.01 * (multiplier + 1)
		cash -= buy_tier_1
		buy_tier_1 *= 1.5
		bought_tier_1 += 1
	#co 10 podwaja ilość zdobywanej money
	if bought_tier_1 == needed_for_boost_tier_1:
		add_tier_1 *= 2
		needed_for_boost_tier_1 += 10
	print(multiplier)

func _on_tier_2_pressed():
	#jak za mało kasy to nie kupisz
	if cash >= buy_tier_2:
		add_tier_2 += 0.05 * (multiplier + 1)
		cash -= buy_tier_2
		buy_tier_2 *= 1.5
		bought_tier_2 += 1
	#co 10 podwaja ilość zdobywanej money
	if bought_tier_2 == needed_for_boost_tier_2:
		add_tier_2 *= 2
		needed_for_boost_tier_2 += 10

#reset
func _on_reset_pressed():
	if bought_tier_2 >= requiered_for_multiplier:
		cash = 1
		bought_tier_2 = 0
		bought_tier_1 = 0
		needed_for_boost_tier_1 = 10
		needed_for_boost_tier_2 = 10
		buy_tier_1 = 1
		buy_tier_2 = 100
		add_tier_1 = 0
		add_tier_2 = 0
		multiplier += 0.5
		multiplier_count += 1
		requiered_for_multiplier += 10

#reset pokazywanie informacji
func _on_reset_mouse_entered():
	%reset_description.visible = true
	%reset_description_background.visible = true

func _on_reset_mouse_exited():
	%reset_description.visible = false
	%reset_description_background.visible = false

#klik boost
func _on_click_boost_pressed():
	click_boost += 1
	%click_boost_timer.start()

#klik boost pokazywanie informacji
func _on_click_boost_mouse_entered():
	%click_boost_description.visible = true
	%click_boost_description_background.visible = true

func _on_click_boost_mouse_exited():
	%click_boost_description.visible = false
	%click_boost_description_background.visible = false

#klik boost ulepszenia
func _on_click_boost_more_clicks_pressed():
	if cash >= needed_cash_for_clicks:
		click_max += 1
		cash -= needed_cash_for_clicks
		needed_cash_for_clicks *= 2

func _on_click_boost_more_time_pressed():
	if cash >= needed_cash_for_time:
		%click_boost_timer.wait_time += 0.1
		cash -= needed_cash_for_time
		needed_cash_for_time *= 2
		time_between_clicks += 0.1 

#quit
func _on_quit_pressed():
	get_tree().quit()

