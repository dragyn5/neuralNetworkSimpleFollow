require 'ruby2d'
require_relative 'neuron'
require_relative 'thing'

class CheckYDifferenceNeuron < Neuron
  def fire(xtrue, ytrue)
    
    if ytrue
      sendSignal
    end
    @charge = 0
  end
end
class CheckXDifferenceNeuron < Neuron
  def fire(xtrue, ytrue)
    if xtrue
      sendSignal
    end
    
    @charge = 0    
  end
end