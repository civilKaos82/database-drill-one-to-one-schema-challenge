class Superhero
  attr_reader :name, :alter_ego, :intelligence, :strength, :speed, :durability, :power, :combat, :sidekick

  def initialize(args = {})
    self.name = args[:name]
    self.alter_ego = args[:alter_ego]
    self.intelligence = args[:intelligence]
    self.strength = args[:strength]
    self.speed = args[:speed]
    self.durability = args[:durability]
    self.power = args[:power]
    self.combat = args[:combat]
    self.sidekick = args[:sidekick]
  end

  def sidekick=(new_sidekick)
    return if sidekick == new_sidekick

    old_sidekick = sidekick
    @sidekick = new_sidekick

    break_association_with(old_sidekick)
    make_self_superhero_of(new_sidekick)
  end

  private
  attr_writer :name, :alter_ego, :intelligence, :strength, :speed, :durability, :power, :combat

  def make_self_superhero_of(some_sidekick)
    some_sidekick.superhero = self if some_sidekick
  end

  def break_association_with(some_sidekick)
    some_sidekick.superhero = nil if some_sidekick
  end
end
