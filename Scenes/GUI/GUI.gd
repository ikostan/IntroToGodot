extends CanvasLayer


func update_lives(live):
	$Control/VBoxContainer/LiveCount.text = 'Lives: ' + str(live)


func update_coins(coins):
	$Control/VBoxContainer/CoinsCount.text = 'Coins: ' + str(coins)
