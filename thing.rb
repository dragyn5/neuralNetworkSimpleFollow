require 'ruby2d'
require_relative 'neuron'
require_relative 'inputNeurons'
require_relative 'outputNeurons'


class Thing
  attr_accessor :neuralNetwork, :body
  def initialize(lvl1Hidden, lvl2Hidden)
    @body = Square.new
    @body.size = 10
    @neuralNetwork = [[],[],[],[]]
    @body.x = 150
    @body.y = 150
    neuralNetworkInitialize(lvl1Hidden,lvl2Hidden)
  end

  def changeY(amt)
    @body.y += amt
  end

  def changeX(amt)
    @body.x += amt
  end

  def itsAlive(xtrue, ytrue)
    @neuralNetwork[0].each do |neuron|
      neuron.fire(xtrue, ytrue)
    end
    @neuralNetwork[1].each do |neuron|
      neuron.fire
    end
    @neuralNetwork[2].each do |neuron|
      neuron.fire
    end
    @neuralNetwork[3].each do |neuron|
      neuron.fire
    end
  end

  def neuralNetworkInitialize(lvl1, lvl2)
    / output Neurons /
     @neuralNetwork[3].push(IncreaseXNeuron.new(rand,[], self))
     @neuralNetwork[3].push(DecreaseXNeuron.new(rand,[], self))
     @neuralNetwork[3].push(IncreaseYNeuron.new(rand,[], self))
     @neuralNetwork[3].push(DecreaseYNeuron.new(rand,[], self))
    lvl2.times do
      @neuralNetwork[2].push(Neuron.new(rand,@neuralNetwork[3], self))
    end    
    lvl1.times do
      @neuralNetwork[1].push(Neuron.new(rand,@neuralNetwork[2], self))
    end    
    / input neurons/
    @neuralNetwork[0].push(CheckYDifferenceNeuron.new(rand,@neuralNetwork[1], self))
    @neuralNetwork[0].push(CheckXDifferenceNeuron.new(rand,@neuralNetwork[1], self))
  end

  def checkMovement(array)
    xcloser = array[0]
    ycloser = array[1]
    @neuralNetwork[3].each do |neuron|
      neuron.checkIfFiredCorrectly(xcloser, ycloser)
    end
    learn
  end

  def learn
    @neuralNetwork.reverse.each do |array|
      array.each do |neuron|
        neuron.backPropogation
      end
    end
  end

end