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

    old_superhero = superhero
    @superhero = new_superhero

    break_association_with(old_superhero)
    make_self_sidekick_of(new_superhero)
  end

  private
  attr_writer :name, :alter_ego, :resourcefulness, :loyalty, :humor

  def make_self_sidekick_of(some_superhero)
    some_superhero.sidekick = self if some_superhero
  end

  def break_association_with(some_superhero)
    some_superhero.sidekick = nil if some_superhero
  end
end
