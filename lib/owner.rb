require 'pry'
class Owner
  # code goes here
  #has many cats and dogs

  @@all = []
  @@count = 0

  attr_reader :name, :species
  #attr_accessor :cat

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @@count += 1
    
    @cats = []
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@all = []
    @@count = 0
  end

  #associations

  # def add_cat(cat)
  #   @cats << cat

  #   cat.owner = self if cat.owner != self
  # end

  def cats
    #binding.pry
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.map do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.map{|cat| cat.mood = "happy"}
  end

  def sell_pets
    cats.map do |cat| 
      cat.mood = "nervous" 
      cat.owner = nil
    end
    dogs.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets
    
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end