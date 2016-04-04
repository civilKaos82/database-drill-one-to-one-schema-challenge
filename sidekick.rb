class Sidekick
  attr_reader :name, :alter_ego, :resourcefulness, :loyalty, :humor, :superhero

  def initialize(args ={})
    @name = args[:name]
    @alter_ego = args[:alter_ego]
    @loyalty = args[:loyalty]
    @resourcefulness = args[:resourcefulness]
    @humor = args[:humor]
  end

  def superhero=(new_superhero)
    unless superhero == new_superhero
      # Break association with old superhero
      superhero.sidekick = nil if superhero

      # Make association with new superhero
      @superhero = new_superhero
      superhero.sidekick = self
    end
  end
end
