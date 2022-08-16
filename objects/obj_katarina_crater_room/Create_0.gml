instance_activate_object(obj_player);
// make it so that our objects higher on the y axis are drawn first
visible = false;

moveForward = true;
moveCam = false;
craterTextbox = false;
runChoice = false;

pushChoice = false;
stareChoice = false;
global.pushChoice = false;
global.stareChoice = false;

cutProg = 0;

hasText = false;
portrait_index = 10;
portrait = spr_kat_faces;
voice = snd_meow;
name = "Katarina";
text = ["Well, I guess it's just me.",
		"That's not a crater, it's just a massive hole.",
		"How the hell did this get here?",
		"..."];
speakers = [id,id,id,id];
next_line = [0,0,-1,0];
scripts = [-1,
[change_variable, id, "portrait_index", 1],
[change_variable, id, "moveCam", true],
-1];

text2 = ["Sheesh. This thing is so deep, I can't even see the bottom.",
		"I wonder how far down it goes...",
		"..."];
speakers2 = [id,id,id];
next_line2 = [0,-1,0];
scripts2 = [-1,
[change_variable, id, "runChoice", true],
-1
];

text3 = [["    Look into the hole with Katarina",
		"    Do an epic prank and push her in"],
		"..."];
speakers3 = [obj_player,obj_player];
next_line3 = [[-1,-1],0];
scripts3 = [[[change_variable, id, "stareChoice", true],[change_variable, id, "pushChoice", true]],
-1
];

text4 = ["W-WAIT! DON'T STAND THERE, YOU IDIOT!",
		"..."];
speakers4 = [id,id];
next_line4 = [-1,0];
scripts4 = [[change_variable, obj_cliff_park, "cliffBreak", true],
-1
];