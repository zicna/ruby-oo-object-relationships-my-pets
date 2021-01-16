class Dog
  # code goes here
  #belongs to Owner

  @@all = []

  attr_reader :name
  attr_accessor :owner, :mood

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end
end