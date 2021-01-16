class Cat
  # code goes here
  #belongs to Owner

  @@all = []

  attr_reader :name
  attr_accessor :mood, :owner

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end

  # def owner=(owner)
  #   @owner = owner

  #   owner.add_cat(self) unless owner.cats.include?(self)
  # end
end