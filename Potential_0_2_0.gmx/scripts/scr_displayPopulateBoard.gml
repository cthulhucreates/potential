///scr_displayPopulateBoard()

var startX = obj_board.x;
var startY = obj_board.y;
var markerSize = sprite_get_width(spr_boardMarker);

var i;
var j;
for(i = 0; i < 10; i++){
    for(j = 0; j < 10; j++){
        var xPos = startX + (markerSize * j + 1);
        var yPos = startY + (markerSize * i + 1);
        
        //  Set the pieceEntry variable with the relvent row position of the piece in the ds_grid if there is one at the current cPos
        var pieceID = ds_grid_get(board, j, i);
        
        //  Create a marker at the current position, and set it's variables
        var marker = instance_create(xPos, yPos, obj_boardMarker);
        marker.row = i;
        marker.col = j; 
        
        //  If there is supposed to be a piece at the current position, create a piece and set it's variables
        if(pieceID != 0){
            xPos = marker.x + (markerSize / 2);
            yPos = marker.y + (markerSize / 2);
            var pieceEntry = ds_grid_value_y(pieces, 0, 0, 0, ds_grid_height(pieces) - 1, pieceID);
            
            var piece = instance_create(xPos, yPos, obj_piece);
            piece.pieceID = pieceID;
            
            piece.image_index = ds_grid_get(pieces, 1, pieceEntry);
            piece.charge = ds_grid_get(pieces, 2, pieceEntry);
        };    
    };
};
