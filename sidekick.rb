class Sidekick
  attr_reader :name, :alter_ego, :resourcefulness, :loyalty, :humor, :superhero

  def initialize(args ={})
    self.name = args[:name]
    self.alter_ego = args[:alter_ego]
    self.loyalty = args[:loyalty]
    self.resourcefulness = args[:resourcefulness]
    self.humor = args[:humor]
    self.superhero = args[:superhero]
  end

  def superhero=(new_superhero)
    return if superhero == new_superhero

    break_association_with_superhero
    @superhero = new_superhero
    associate_self_with_superhero
  end

  private
  attr_writer :name, :alter_ego, :resourcefulness, :loyalty, :humor

  def associate_self_with_superhero
    superhero.sidekick = self if superhero
  end

  def break_association_with_superhero
    superhero.sidekick = nil if superhero
  end
end
