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
    return if superhero == new_superhero

    break_association_with_superhero
    @superhero = new_superhero
    associate_self_with_superhero
  end

  private
  def associate_self_with_superhero
    superhero.sidekick = self if superhero
  end

  def break_association_with_superhero
    superhero.sidekick = nil if superhero
  end
end
