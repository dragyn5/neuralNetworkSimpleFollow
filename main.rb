require 'ruby2d'
require_relative 'neuron'
require_relative 'thing.rb'
require_relative 'inputNeurons'
require_relative 'outputNeurons'
@windowHeight, @windowWidth = 1300, 1300
set width: @windowWidth, height: @windowHeight


def compareXCoordinates
  if (get :mouse_x) > @thing1.body.x
    return true
  end
end
def compareYCoordinates
  if (get :mouse_y) > @thing1.body.y
    return true
  end
end

def compareCoordinates
  / x,y/
  return [(@thing1.body.x - (get :mouse_x)).abs,(@thing1.body.y - (get :mouse_y)).abs]
end

def gotCloserTest
  currentCoordinates = compareCoordinates
  xcloser = false
  ycloser = true
  if @comparedCoordinates[0] > currentCoordinates[0] then xcloser = true end
  if @comparedCoordinates[1] > currentCoordinates[1] then ycloser = true end
  return [xcloser, ycloser]
end

@thing1 = Thing.new(8,4)

@comparedCoordinates = compareCoordinates

update do
  @thing1.itsAlive(compareXCoordinates, compareYCoordinates)
  @thing1.checkMovement(gotCloserTest)
end
show