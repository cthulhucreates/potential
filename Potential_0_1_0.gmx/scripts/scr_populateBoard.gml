///scr_populateBoard()
//Populate board with snap guides
var i;
var j;
var boardCornerx = obj_board.x - (obj_board.sprite_width / 2);
var boardCornery = obj_board.y - (obj_board.sprite_height / 2);

if(instance_exists(obj_piece)) instance_destroy(obj_piece);
if(instance_exists(obj_snapGuide)) instance_destroy(obj_snapGuide);

for(i = 0; i < 10; i++) {
    for(j = 0; j < 10; j++) {
        instance_create(
            boardCornerx + (obj_snapGuide.sprite_width * i)
            ,boardCornery + (obj_snapGuide.sprite_height * j)
            ,obj_snapGuide
        );
    }
}

//Populate board with red pieces
for(i = 0; i < 2; i++) {
    for(j = 0; j < 8; j++) {
        //alternate placement based on row and column (i and j)
        if((i = 0 && j mod 2 == 0) || i = 1 && j mod 2 == 1){
            var startx = boardCornerx + obj_snapGuide.sprite_width;
            var starty = boardCornery + obj_snapGuide.sprite_height;
            instance_create(
                startx + (obj_piece.sprite_width * j)
                ,starty + (obj_piece.sprite_height * i)
                ,obj_piece
            );
        }
    }
}

//Populate board with blue pieces
for(i = 0; i < 2; i++) {
    for(j = 0; j < 8; j++) {
        //alternate placement based on row and column (i and j)
        if((i = 0 && j mod 2 == 1) || i = 1 && j mod 2 == 0){
            var startx = boardCornerx + (obj_snapGuide.sprite_width);
            var starty = boardCornery + (obj_snapGuide.sprite_height * 7);
            instance_create(
                startx + (obj_piece.sprite_width * j)
                ,starty + (obj_piece.sprite_height * i)
                ,obj_piece
            );
        }
    }
}
