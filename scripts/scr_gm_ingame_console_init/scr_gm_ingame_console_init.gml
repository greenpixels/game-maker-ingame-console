function init_ingame_console() {
	return instance_create_depth(0, 0, 15000, obj_gm_ingame_console, { initialized: true })
		.add_command(
			"help", 
			function() {
				log_info("List of available commands:");
				struct_foreach(obj_gm_ingame_console.command_map, function(_command) {
					log_info("- " + _command);
				});
			}
		)
		.add_command(
			"clear", 
			function() {
				obj_gm_ingame_console.output = [];
			}
		)
}