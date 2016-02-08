#modulo chek moves
#class move
#class piece < distintas piezas 

#king1 = King.new(3,3,2,3) #mov vertical
# king1.check_move
# king2 = King.new(3,3,3,2) #mov lateral
# king2.check_move
# king3 = King.new(3,3,4,3)
# king3.check_move
# king4 = King.new(3,3,4,2)
# king4.check_move
# king5 = King.new(3,3,4,4)


module Checkmoves
  def check_rook(initial_pos, final_pos)
      initial_pos[0] == final_pos[0] || initial_pos[1] == final_pos[1]
  end
  
  def check_pawn(initial_pos, final_pos, color)
      if color == "b" &&  final_pos[0] == initial_pos[0] && final_pos[1] > initial_pos[1] #horizontal se mantiene y la vertical aumenta
        true 
      elsif color == "w" &&  final_pos[0] == initial_pos[0] && final_pos[1] < initial_pos[1] #horizontal se mantiene y la vertical decrece
        true 
      end
  end

  def check_bishop(initial_pos, final_pos)
       (initial_pos[0] - final_pos[0]).abs == (initial_pos[1] - final_pos[1]).abs
  end

  def check_king(initial_pos, final_pos) 
    (final_pos[0] == initial_pos[0]+1) || (final_pos[1] == initial_pos[1]+1)
    # ((final_pos[1] == initial_pos[1]  || (final_pos[1] - initial_pos[1]).abs == 1 ) && (final_pos[0] == initial_pos[0] || (final_pos[0] - initial_pos[0]).abs == 1 )) || 
    # (((initial_pos[0] - final_pos[0]).abs == (initial_pos[1] - final_pos[1]).abs) && ((final_pos[0] - initial_pos[0]).abs == 1  || (final_pos [1] - initial_pos[1]).abs == 1 )
  end
  def check_knight
    ((initial_pos[0] - final_pos[0]).abs == 2 && (initial_pos[1] - final_pos[1]).abs == 1) || ((initial_pos[1] - final_pos[1]).abs == 2 && (initial_pos[0] - final_pos[0]).abs == 1) 
  end

end

class Board
  def initialize
    @board = Array.new(8){ Array.new(8,"--")}
    #@board[7][0] = :wR
    @board.each do | b|
      print b 
      puts     
    end
  end
end

class Piece
  include Checkmoves
  def initialize(initpos0, initpos1, finalpos0, finalpos1 ,color="w")
    @inital_pos = [initpos0, initpos1]
    @final_pos = [finalpos0, finalpos1]
    @color = color
  end
  
end


class Rook < Piece
  def check_move
    if check_rook(@inital_pos,@final_pos)
      puts "Legal"
    else
      puts "Illegal"
    end
  end
end

class Pawn < Piece
  def check_move
    if check_pawn(@inital_pos,@final_pos,@color)
      puts "Legal"
    else
      puts "Illegal"
    end
  end
end

class Bishop < Piece
  def check_move
    if check_bishop(@inital_pos,@final_pos)
      puts "Legal"
    else
      puts "Illegal"
    end
  end
end

class Queen < Piece
  def check_move
    if check_bishop(@inital_pos,@final_pos) || check_rook(@inital_pos,@final_pos)
      puts "Legal"
    else
      puts "Illegal"
    end
  end
end

class King < Piece
  def check_move
    if (check_bishop(@inital_pos,@final_pos) || check_rook(@inital_pos,@final_pos)) && check_king(@inital_pos,@final_pos)
      puts "Legal"
    else
      puts "Illegal"
    end
  end
end

class Knight < Piece
  def check_move
    if check_knight(@inital_pos,@final_pos)
      puts "Legal"
    else
      puts "Illegal"
    end
  end
end

#tablero = Board.new 
# rook1 = Rook.new(0,0,1,7)
# rook1.check_move
# rook = Rook.new(0,0,0,7)
# rook.check_move
# pawn1 = Pawn.new(1,2,2,2,"b")
# pawn1.check_move
# pawn = Pawn.new(5,0,4,0,)
# pawn.check_move
#bishop = Bishop.new(1,1,0,2,)
#bishop.check_move
#bishop2 = Bishop.new(2,2,2,1)
#bishop2.check_move
# queen = Queen.new(3,3,2,2)
# queen.check_move
# queen2 = Queen.new(3,3,0,3)
# queen2.check_move
# queen3 = Queen.new(3,3,0,1)
# queen3.check_move
king1 = King.new(1,3,3,2) #mov vertical
king1.check_move
king2 = King.new(3,3,2,3) #mov lateral
king2.check_move
king3 = King.new(3,3,4,2) #mov diagonal
king3.check_move
king4 = King.new(3,3,2,4)#mov diagonal
king4.check_move
# king5 = King.new(3,3,5,5)

# b[0][0]
# b[1,3]
# class Paw < Piece 
# end

# class Knight < Piece 

# end

# class  Queen < Piece 
  #if check_rook || check_bishop
    #puts "true"
# end

# class King < Pice
# end


#   def move(final_position)
#     tempinit_position = @initial_pos.split("")
#     tempfinal_position = @final_pos.split("")
#     if(tempinit_position,tempfinal_position) == true)
#       puts "LEGAL"
#     else
#       puts "ILEGAL" 
#     end
#   end
# end

