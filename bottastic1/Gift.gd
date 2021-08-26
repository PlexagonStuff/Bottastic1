extends Gift
var skits = ["https://www.youtube.com/watch?v=6Mce7WTxbSo","https://www.youtube.com/watch?v=Zcf-XoDtgqk","https://www.youtube.com/watch?v=KJbHrZVTduQ","https://www.youtube.com/watch?v=jHfsWc1nUx8","https://www.youtube.com/watch?v=NUrghhh9mM8","https://www.youtube.com/watch?v=lIGueEYDU8M","https://www.youtube.com/watch?v=ZMJKeUT8_Wg","https://www.youtube.com/watch?v=1POEZ1x37WM","https://www.youtube.com/watch?v=d_D4n3CcHCQ","https://www.youtube.com/watch?v=9wItvEICj0c","https://www.youtube.com/watch?v=kJkaWV5MvPg","https://www.youtube.com/watch?v=Y3Q6Eaq5ZQk","https://www.youtube.com/watch?v=neILZOQNz6s","https://www.youtube.com/watch?v=yu4qvpvZay8","https://www.youtube.com/watch?v=B9Fe9tiyg5M","https://www.youtube.com/watch?v=GrmjSFWiVpg","https://www.youtube.com/watch?v=1YScVDMmpsM"]
var rng = RandomNumberGenerator.new()
onready var gameTitle = $LineEdit
var sabi = 0
var activeViewers = []
var jokes = ["The rotation of the Earth really makes my day.", "Why was Pavlov’s hair so soft? Because he conditioned it", "Sabi2798", "I once had a dream I was swimming in an ocean of orange soda, but it was just a Fanta sea", "I once met someone who turned their papers in at 4:20. They wanted to ensure they got high grades.", "What do you get when you cross a joke with a rhetorical question?", "What happened to the duck that read through this channel? He quacked up", "Did you know left handed people on average finish tests faster than people who died at birth?", "why can’t the ender dragon read a book? Because she always starts at the End.", "what do you call a Dragon with no silver? A Dron", "What do you get when you wear a watch for a belt? A waist of time!", "Why did Bob pay top dollar for a box of candy? Because it was in mint condition", "What rock group has four men that don't sing? mount rushmore", "A woman entered an online pun contest. She submitted ten different puns in the hope that at least one would win. Unfortunately, no pun in ten did.", "Sunday was a pretty depressing day, but not as bad as the day before. That was a Saturday"]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	sabi = 0
	rng.randomize()
	connect("cmd_no_permission", self, "no_permission")
	connect("chat_message", self, "parse_chat_data")
	connect("whisper_message", self, "parse_chat_data")
	connect_to_twitch()
	yield(self, "twitch_connected") 
	
	#authenticate_oauth(Global.botAccount, Global.authToken)
	authenticate_oauth("plexagonsbuff", "oauth:5o4rfqk2gli3g2a6l49hfb18ydfroq")
	if(yield(self, "login_attempt") == false):
	  print("Invalid username or token.")
	  return
	#join_channel(Global.hostChannel)
	join_channel("forktastic1")
	add_command("!helloworld", self, "hello_world")
	
	chat("Casual Youtuber that picked up streaming because life is short! I stream Duck Life speedruns, Taiko on Switch with the drum controller, and other games I want to play through. We're all pretty chill around here, so feel free to engage, interact, and follow! Use #help for a list of commands") # Replace with function body.
func parse_chat_data(sender_data: SenderData, message: String, override=false):
	parse_chat_input(sender_data.user, message, override)
	
	
func parse_chat_input(player_name: String, message: String, override=false):
	print(activeViewers)
	if(!player_name in activeViewers):
		activeViewers.append(player_name)
	if message:
		run_player_command(player_name, message)
		
	if message.begins_with("#youtube"):
		chat("Follow Fork at tinyurl.com/fork1234")
	if message.begins_with("#twitter"):
		chat("Follow fork at twitter.com/Forktastic1")
	if message.begins_with("#discord"):
		chat("Fork's discord is https://www.discord.gg/gZjHjM644u")
	if message.begins_with("#help"):
		chat("Commands are youtube, twitter, discord, game, skit, wr, whatthefork, src, instagram, dl, taiko, cool, joke, active. Add a # in front of each word.")
	if message.begins_with("#game"):
		chat("Fork is playing " + gameTitle.text)
	if message.begins_with("#skit"):
		chat("Here's a random Forktastic skit! " + skits[rng.randi_range(0, (skits.size() - 1))])
	if message.begins_with("#wr"):
		chat("Currently Fork has one WR on speedrun.com")
	if message.begins_with("#src"):
		chat("Fork's speedrun.com profile is https://www.speedrun.com/user/Forktastic")
	if message.begins_with("#dl"):
		chat("Fork's Speedrun To-Do list can be found here: https://docs.google.com/document/d/1sAttG8UqrH68TRb74fEBHIjvX32-9Sihj9xvToDCv_8/edit?usp=sharing")
	if message.begins_with("#taiko"):
		chat("Fork's Taiko To-Do list can be found here: https://docs.google.com/spreadsheets/d/1sGWQJOLl-5xW4Go45C6ukZ29hMd3ep1h9aEkhvxpT8Q/edit?usp=sharing")
	if message.begins_with("#instagram"):
		chat("Fork's insta is https://www.instagram.com/forktastic1/")
	if message.begins_with("#whatthefork"):
		chat("What the Fork! is Forktastic's podcast with friends about random subjects,from fruit to the fragility of life. You can view all episodes here: https://www.youtube.com/playlist?list=PLqrBrVyFI2CcMNy4PlFifV8ijjag7sfsD")
	if player_name == "sabi2798":
		if floor(rand_range(1, 30)) == 1:
			chat("saaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabi")
	if message.begins_with("#cool"):
		chat(activeViewers[rng.randi_range(0, (activeViewers.size()-1))] + " is cool!")
	if message.begins_with("#joke"):
		chat(jokes[rng.randi_range(0, (jokes.size()-1))])
	if message.begins_with("#active"):
		chat(str(activeViewers))
		#if sabi < 2:
			#chat("saaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabi")
		
		
func run_player_command(player_name: String, player_command: String):
		var p_c = player_command.split(" ")
		print(jokes[0])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Timer_timeout():
	activeViewers.clear() # Replace with function body.
