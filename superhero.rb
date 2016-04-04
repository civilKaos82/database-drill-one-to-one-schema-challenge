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
    unless sidekick == new_sidekick
      # Break association with old sidekick
      sidekick.superhero = nil if sidekick

      # Make association with new sidekick
      @sidekick = new_sidekick
      sidekick.superhero = self
    end
  end
end
