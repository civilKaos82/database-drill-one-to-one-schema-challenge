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

    break_association_with_sidekick
    @sidekick = new_sidekick
    associate_self_with_sidekick
  end

  private
  attr_writer :name, :alter_ego, :intelligence, :strength, :speed, :durability, :power, :combat

  def associate_self_with_sidekick
    sidekick.superhero = self if sidekick
  end

  def break_association_with_sidekick
    sidekick.superhero = nil if sidekick
  end
end
