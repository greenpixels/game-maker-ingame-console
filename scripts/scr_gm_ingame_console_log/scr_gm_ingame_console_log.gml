enum OUTPUT_TYPE {
	WARN,
	INFO, 
	ERROR,
	ECHO
}

function output_log(_message, _type) constructor {
	message = _message;
	type = _type;
}

function log(_message, _type) {
	with(obj_gm_ingame_console) {
		array_push(output, new output_log(_message, _type));
		if(array_length(output) > max_outputs) {
			array_shift(output);	
		}
	}
}

function log_error(_message) {
	log(_message, OUTPUT_TYPE.ERROR);
}

function echo(_message) {
	log(_message, OUTPUT_TYPE.ECHO);
}

function log_info(_message) {
	log(_message, OUTPUT_TYPE.INFO);
}

function log_warn(_message) {
	log(_message, OUTPUT_TYPE.WARN);
}