// --- Execute scripts attached to the current page ---
// Format: scripts[page] = [script_fn, arg0, arg1, ...]
// For choice pages:  scripts[page] = [[script_fn, ...], [script_fn, ...], ...]

if (!is_array(scripts)) exit;

var pagescript = scripts[page];

// For choice dialogue, pick the script matching the chosen option
if (choice_dialogue && is_array(scripts[page])) {
    pagescript = pagescript[choice];
}

if (pagescript == -1) exit;

var len = array_length_1d(pagescript);

if (len == 1) {
    script_execute(pagescript[0]);
} else {
    var args = array_create(len - 1, 0);
    array_copy(args, 0, pagescript, 1, len - 1);
    script_execute_alt(pagescript[0], args);
}