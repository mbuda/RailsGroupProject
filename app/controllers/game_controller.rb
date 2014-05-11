class GamesController < ApplicationController

def show
@game = Game.show
end


end
