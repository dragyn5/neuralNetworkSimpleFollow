require_relative 'neuron'
require 'ruby2d'
require_relative 'thing'

class IncreaseXNeuron < Neuron
  def fire
    @chargeBias = @charge - @bias
    if sigmoid(@chargeBias) > 0.5
      @parentThing.changeX(1)
      @didFire = true
    else
      @didFire = false
    end
    @charge = 0
  end

  def checkIfFiredCorrectly(xcloser, ycloser)
    if @didFire == true && xcloser then @firedCorrectly = true  else @firedCorrectly = false end
    if @didFire == false && xcloser then @firedCorrectly = true  else @firedCorrectly = false end
  end
end
class DecreaseXNeuron < Neuron
  def fire
    @chargeBias = @charge - @bias
    if sigmoid(@chargeBias) > 0.5
      @parentThing.changeX(-1)
      @didFire = true
    else
      @didFire = false
    end
    @charge = 0
  end

  def checkIfFiredCorrectly(xcloser, ycloser)
    if @didFire == true && xcloser then @firedCorrectly = true  else @firedCorrectly = false end
    if @didFire == false && xcloser then @firedCorrectly = true  else @firedCorrectly = false end
  end
end
class IncreaseYNeuron < Neuron
  def fire
    @chargeBias = @charge - @bias
    if sigmoid(@chargeBias) > 0.5
      @parentThing.changeY(1)
      @didFire = true
    else
      @didFire = false
    end
    @charge = 0
  end

  def checkIfFiredCorrectly(xcloser, ycloser)
    if @didFire == true && ycloser then @firedCorrectly = true  else @firedCorrectly = false end
    if @didFire == false && ycloser then @firedCorrectly = true  else @firedCorrectly = false end
  end
end
class DecreaseYNeuron < Neuron
  def fire
    @chargeBias = @charge - @bias
    if sigmoid(@chargeBias) > 0.5
      @parentThing.changeX(-1)
      @didFire = true
    else
      @didFire = false
    end
    @charge = 0
  end

  def checkIfFiredCorrectly(xcloser, ycloser)
    if @didFire == true && ycloser then @firedCorrectly = true  else @firedCorrectly = false end
    if @didFire == false && ycloser then @firedCorrectly = true  else @firedCorrectly = false end
  end
end
