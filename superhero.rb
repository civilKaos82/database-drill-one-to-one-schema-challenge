class Superhero
  attr_reader :name, :alter_ego, :intelligence, :strength, :speed, :durability, :power, :combat, :sidekick

  def initialize(args = {})
    @name = args[:name]
    @alter_ego = args[:alter_ego]
    @intelligence = args[:intelligence]
    @strength = args[:strength]
    @speed = args[:speed]
    @durability = args[:durability]
    @power = args[:power]
    @combat = args[:combat]
  end

  def sidekick=(new_sidekick)
    return if sidekick == new_sidekick

    break_association_with_sidekick
    @sidekick = new_sidekick
    associate_self_with_sidekick
  end

  private
  def associate_self_with_sidekick
    sidekick.superhero = self if sidekick
  end

  def break_association_with_sidekick
    sidekick.superhero = nil if sidekick
  end
end
