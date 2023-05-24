init_ingame_console()
	.add_command("joke", function() {
		log_info(
			choose(
				"I'm reading a book about anti-gravity. It's impossible to put down!",
				"Why don't scientists trust atoms? Because they make up everything!",
				"I used to be a baker, but I couldn't make enough dough."
			)
		);
	})
	.add_command("spawn", function(_params) {
		var _format_message = "Format: spawn item_id amount";
		if(array_length(_params) == 2) {
			var _item_id = _params[0];
			var _amount = _params[1];
			log_info($"Spawned {_item_id} {_amount} times");
		} else {
			log_warn(_format_message);	
		}
	});