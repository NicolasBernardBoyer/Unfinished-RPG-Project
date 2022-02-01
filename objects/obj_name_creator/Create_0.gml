gridX = 0;
gridY = 0;

letterString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ   ";

xLetters = 10;
yLetters = 3;

charCount = 1;

for(var yy = 0; yy < yLetters; yy ++){
	for (var xx = 0; xx < xLetters; xx++){
		if(charCount <= 29){
			a_letters[xx,yy] = string_char_at(letterString, charCount);
			}else{
				a_letters[xx, yy] = "OK"
			}
		
		charCount ++;
	}
}