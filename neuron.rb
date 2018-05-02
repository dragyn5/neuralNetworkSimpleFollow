class Neuron
  attr_accessor :firedCorrectly
  def initialize(bias, connections, parentThing)
    @connections = {}
    @parentThing = parentThing
    @learningMultiplier = 0.1
    connections.each do |neuron|
      one = rand
      if rand > 0.5 then one -= 1 end
      @connections[neuron] = one
    end
    @backConnections = {}
    @bias = bias
    @charge = 0
    @firedCorrectly = false
  end

  def sendSignal
    @connections.each do |neuron|
      neuron[0].receiveSignal(1*neuron[1])
      neuron[0].receiveBackConnections(self, neuron[1])
    end
    / Unsure if I should keep this part/
  end

  def receiveSignal(amt)
    @charge += amt
  end

  def receiveBackConnections(neuron, weight)
    @backConnections[neuron] = weight
  end

  def fire
    if sigmoid(@charge - @bias) > 0.0
      sendSignal
    end
    @charge = 0
  end

  def backPropogation
    if @firedCorrectly == true
      /strengthen connection /
      @backConnections.keys.each do |neuron|
        neuron.firedCorrectly = true
      end
      @backConnections.values.each do |weight|
        if weight > 1
          weight += (1 - @confidenceRating) * @learningMultiplier
        else
          weight -= (1 - @confidenceRating) * @learningMultiplier
        end
      end
    else
      @backConnections.keys.each do |neuron|
        neuron.firedCorrectly = false
      end
      @backConnections.values.each do |weight|
        if weight > 1
          weight -= (1 - @confidenceRating) * @learningMultiplier
        else
          weight += (1 - @confidenceRating) * @learningMultiplier
        end
      end
    end
  end

  def sigmoid(chargeAmt)
    @confidenceRating = 1/(1+2.7182818284590452353602874713527**(-chargeAmt))
    return @confidenceRating
  end

end