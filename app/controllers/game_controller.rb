class GamesController < ApplicationController

def show
<<<<<<< HEAD

@game = Game.find(params[:id])

=======
@game = Game.show
>>>>>>> 14-show-game-fix-attempt
end


end
