extends CanvasLayer


func update_live(live):
	$Control/VBoxContainer/LiveCount.text = 'Live: ' + str(live)


func update_coins(coins):
	$Control/VBoxContainer/CoinsCount.text = 'Coins: ' + str(coins)
