extends Node2D

var save_path = "user://data.save"
#dane
var cash = 1
var add_full = 0 
var menu_pressed = 0
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
var needed_for_reset = 1
var needed_for_another_tier = 2
#zmienne 1 tieru
var add_tier_1 = 0.00
var buy_tier_1 = 1
var bought_tier_1 = 0
var needed_for_boost_tier_1 = 10 
#zmienne 2 tieru
var add_tier_2 = 0.00
var buy_tier_2 = 50
var bought_tier_2 = 0
var needed_for_boost_tier_2 = 10
#zmienne 3 tieru
var add_tier_3 = 0.00
var buy_tier_3 = 100
var bought_tier_3 = 0
var needed_for_boost_tier_3 = 10
#zmienne 4 tieru
var add_tier_4 = 0.00
var buy_tier_4 = 500
var bought_tier_4 = 0
var needed_for_boost_tier_4 = 10
#zmienne 5 tieru
var add_tier_5 = 0.00
var buy_tier_5 = 1000
var bought_tier_5 = 0
var needed_for_boost_tier_5 = 10
#zmienne 6 tieru
var add_tier_6 = 0.00
var buy_tier_6 = 5000
var bought_tier_6 = 0
var needed_for_boost_tier_6 = 10
#zmienne 7 tieru
var add_tier_7 = 0.00
var buy_tier_7 = 10000
var bought_tier_7 = 0
var needed_for_boost_tier_7 = 10

#menu
func _on_menu_pressed():
	menu_pressed += 1
	if menu_pressed == 1:
		$"Menu/Save buttons/save_button".visible = true
		$"Menu/Save buttons/load_button".visible = true
		$"Menu/Save buttons/delete_button".visible = true
		$"Menu/Save buttons/reset_button".visible = true
		$Menu/quit.visible = true
	else:
		$"Menu/Save buttons/save_button".visible = false
		$"Menu/Save buttons/load_button".visible = false
		$"Menu/Save buttons/delete_button".visible = false
		$"Menu/Save buttons/reset_button".visible = false
		$Menu/quit.visible = false
	if menu_pressed >= 2:
		menu_pressed = 0

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
	file.store_var(needed_for_reset)
	file.store_var(needed_for_another_tier)
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
	#tier 3
	file.store_var(add_tier_3)
	file.store_var(buy_tier_3)
	file.store_var(bought_tier_3)
	file.store_var(needed_for_boost_tier_3)
	#tier 4
	file.store_var(add_tier_4)
	file.store_var(buy_tier_4)
	file.store_var(bought_tier_4)
	file.store_var(needed_for_boost_tier_4)
	#tier 5
	file.store_var(add_tier_5)
	file.store_var(buy_tier_5)
	file.store_var(bought_tier_5)
	file.store_var(needed_for_boost_tier_5)
	#tier 6
	file.store_var(add_tier_6)
	file.store_var(buy_tier_6)
	file.store_var(bought_tier_6)
	file.store_var(needed_for_boost_tier_6)
	#tier 7
	file.store_var(add_tier_7)
	file.store_var(buy_tier_7)
	file.store_var(bought_tier_7)
	file.store_var(needed_for_boost_tier_7)
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
		needed_for_reset = file.get_var(needed_for_reset)
		needed_for_another_tier = file.get_var(needed_for_another_tier)
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
		#tier 3
		add_tier_3 = file.get_var(add_tier_3)
		buy_tier_3 = file.get_var(buy_tier_3)
		bought_tier_3 = file.get_var(bought_tier_3)
		needed_for_boost_tier_3 = file.get_var(needed_for_boost_tier_3)
		#tier 4
		add_tier_4 = file.get_var(add_tier_4)
		buy_tier_4 = file.get_var(buy_tier_4)
		bought_tier_4 = file.get_var(bought_tier_4)
		needed_for_boost_tier_4 = file.get_var(needed_for_boost_tier_4)
		#tier 5
		add_tier_5 = file.get_var(add_tier_5)
		buy_tier_5 = file.get_var(buy_tier_5)
		bought_tier_5 = file.get_var(bought_tier_5)
		needed_for_boost_tier_5 = file.get_var(needed_for_boost_tier_5)
		#tier 6
		add_tier_6 = file.get_var(add_tier_6)
		buy_tier_6 = file.get_var(buy_tier_6)
		bought_tier_6 = file.get_var(bought_tier_6)
		needed_for_boost_tier_6 = file.get_var(needed_for_boost_tier_6)
		#tier 7
		add_tier_7 = file.get_var(add_tier_7)
		buy_tier_7 = file.get_var(buy_tier_7)
		bought_tier_7 = file.get_var(bought_tier_7)
		needed_for_boost_tier_7 = file.get_var(needed_for_boost_tier_7)
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

#quit
func _on_quit_pressed():
	get_tree().quit()

#kod od gry
func _process(delta):
	#money
	add_full = add_tier_1 + add_tier_2 + add_tier_3 + add_tier_4 + add_tier_5 + add_tier_6 + add_tier_7
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
	#tier 3
	%buy_tier_3.text = str("Cost: ", snapped(buy_tier_3, 0.01))
	%add_tier_3.text = str("Production: ", snapped(add_tier_3, 0.01))
	%amount_tier_3.text = str("Amount: ", bought_tier_3)
	%needed_for_boost_tier_3.text = str("Needed for boost: ", needed_for_boost_tier_3)
	#tier 4
	%buy_tier_4.text = str("Cost: ", snapped(buy_tier_4, 0.01))
	%add_tier_4.text = str("Production: ", snapped(add_tier_4, 0.01))
	%amount_tier_4.text = str("Amount: ", bought_tier_4)
	%needed_for_boost_tier_4.text = str("Needed for boost: ", needed_for_boost_tier_4)
	#tier 5
	%buy_tier_5.text = str("Cost: ", snapped(buy_tier_5, 0.01))
	%add_tier_5.text = str("Production: ", snapped(add_tier_5, 0.01))
	%amount_tier_5.text = str("Amount: ", bought_tier_5)
	%needed_for_boost_tier_5.text = str("Needed for boost: ", needed_for_boost_tier_5)
	#tier 6
	%buy_tier_6.text = str("Cost: ", snapped(buy_tier_6, 0.01))
	%add_tier_6.text = str("Production: ", snapped(add_tier_6, 0.01))
	%amount_tier_6.text = str("Amount: ", bought_tier_6)
	%needed_for_boost_tier_6.text = str("Needed for boost: ", needed_for_boost_tier_6)
	#tier 7
	%buy_tier_7.text = str("Cost: ", snapped(buy_tier_7, 0.01))
	%add_tier_7.text = str("Production: ", snapped(add_tier_7, 0.01))
	%amount_tier_7.text = str("Amount: ", bought_tier_7)
	%needed_for_boost_tier_7.text = str("Needed for boost: ", needed_for_boost_tier_7)
	#reset boost
	%count.text = str("Amount: ", multiplier_count)
	%requirements.text = str("Requierd amount of tier ",needed_for_reset + 1, ": ", requiered_for_multiplier)
	%multiplier.text = str("Multiplier: ", multiplier)
	%needed_for_another_tier.text = str("Needed for another tier: ", needed_for_another_tier)
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
	%add_full.text = str("Ink you produce: ", snapped(add_full, 0.01))
	tier_visibility()

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

func _on_tier_2_pressed():
		#jak za mało kasy to nie kupisz
	if cash >= buy_tier_2:
		add_tier_2 += 0.05 * (multiplier + 1)
		cash -= buy_tier_2
		buy_tier_2 *= 1.25
		bought_tier_2 += 1
	#co 10 podwaja ilość zdobywanej money
	if bought_tier_2 == needed_for_boost_tier_2:
		add_tier_2 *= 2
		needed_for_boost_tier_2 += 10

func _on_tier_3_pressed():
		#jak za mało kasy to nie kupisz
	if cash >= buy_tier_3 and needed_for_reset >= 2:
		add_tier_3 += 0.1 * (multiplier + 1)
		cash -= buy_tier_3
		buy_tier_3 *= 1.25
		bought_tier_3 += 1
	#co 10 podwaja ilość zdobywanej money
	if bought_tier_3 == needed_for_boost_tier_3:
		add_tier_3 *= 2
		needed_for_boost_tier_3 += 10

func _on_tier_4_pressed():
		#jak za mało kasy to nie kupisz
	if cash >= buy_tier_4 and needed_for_reset >= 3:
		add_tier_4  += 0.5 * (multiplier + 1)
		cash -= buy_tier_4 
		buy_tier_4  *= 1.25
		bought_tier_4  += 1
	#co 10 podwaja ilość zdobywanej money
	if bought_tier_4  == needed_for_boost_tier_4 :
		add_tier_4  *= 2
		needed_for_boost_tier_4 += 10

func _on_tier_5_pressed():
		#jak za mało kasy to nie kupisz
	if cash >= buy_tier_5 and needed_for_reset >= 4:
		add_tier_5 += 1 * (multiplier + 1)
		cash -= buy_tier_5
		buy_tier_5 *= 1.25
		bought_tier_5 += 1
	#co 10 podwaja ilość zdobywanej money
	if bought_tier_5 == needed_for_boost_tier_5:
		add_tier_5 *= 2
		needed_for_boost_tier_5 += 10

func _on_tier_6_pressed():
		#jak za mało kasy to nie kupisz
	if cash >= buy_tier_6 and needed_for_reset >= 5:
		add_tier_6 += 5 * (multiplier + 1)
		cash -= buy_tier_6
		buy_tier_6 *= 1.25
		bought_tier_6 += 1
	#co 10 podwaja ilość zdobywanej money
	if bought_tier_6 == needed_for_boost_tier_6:
		add_tier_6 *= 2
		needed_for_boost_tier_6 += 10

func _on_tier_7_pressed():
		#jak za mało kasy to nie kupisz
	if cash >= buy_tier_7 and needed_for_reset >= 6:
		add_tier_7 += 10 * (multiplier + 1)
		cash -= buy_tier_7
		buy_tier_7 *= 1.25
		bought_tier_7 += 1
	#co 10 podwaja ilość zdobywanej money
	if bought_tier_7 == needed_for_boost_tier_7:
		add_tier_7 *= 2
		needed_for_boost_tier_7 += 10

func tier_visibility():
	if needed_for_reset >= 2:
		$Tiers/tier3.visible = true
	if needed_for_reset >= 3:
		$Tiers/tier4.visible = true
	if needed_for_reset >= 4:
		$Tiers/tier5.visible = true
	if needed_for_reset >= 5:
		$Tiers/tier6.visible = true
	if needed_for_reset >= 6:
		$Tiers/tier7.visible = true

#reset
func _on_reset_pressed():
	if needed_for_reset == 1:
		if bought_tier_2 >= requiered_for_multiplier:
			reset_boost()
	if needed_for_reset == 2:
		if bought_tier_3 >= requiered_for_multiplier:
			reset_boost()
	if needed_for_reset == 3:
		if bought_tier_4 >= requiered_for_multiplier:
			reset_boost()
	if needed_for_reset == 4:
		if bought_tier_5 >= requiered_for_multiplier:
			reset_boost()
	if needed_for_reset == 5:
		if bought_tier_6 >= requiered_for_multiplier:
			reset_boost()
	if needed_for_reset == 6:
		if bought_tier_7 >= requiered_for_multiplier:
			reset_boost()

func reset_boost():
	cash = 1
	bought_tier_2 = 0
	bought_tier_1 = 0
	needed_for_boost_tier_1 = 10
	needed_for_boost_tier_2 = 10
	buy_tier_1 = 1
	buy_tier_2 = 50
	add_tier_1 = 0
	add_tier_2 = 0
	bought_tier_3 = 0
	bought_tier_4 = 0
	needed_for_boost_tier_3 = 10
	needed_for_boost_tier_4 = 10
	buy_tier_3 = 100
	buy_tier_4 = 500
	add_tier_3 = 0
	add_tier_4 = 0
	bought_tier_6 = 0
	bought_tier_5 = 0
	needed_for_boost_tier_5 = 10
	needed_for_boost_tier_6 = 10
	buy_tier_5 = 1000
	buy_tier_6 = 5000
	add_tier_5 = 0
	add_tier_6 = 0
	bought_tier_7 = 0
	needed_for_boost_tier_7 = 10
	buy_tier_7 = 10000
	add_tier_7 = 0
	multiplier += 0.5
	multiplier_count += 1
	requiered_for_multiplier += 10
	click_boost = 0
	click_max = 10
	needed_cash_for_clicks = 100
	needed_cash_for_time = 100
	time_between_clicks = 0.5
	if requiered_for_multiplier >= 30 and needed_for_reset <= 6:
		needed_for_reset += 1
		requiered_for_multiplier = 10
		needed_for_another_tier += 2
	if needed_for_another_tier >= 12:
		%needed_for_another_tier.visible = false

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
