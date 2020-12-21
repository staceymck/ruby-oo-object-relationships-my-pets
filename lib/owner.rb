class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def self.all
    @@all
  end

  def self.count
    all.count
  end

  def self.reset_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def say_species
    "I am a #{species}."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
  end

  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each{|cat| cat.mood = "happy"}
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  def pets
    cats + dogs
  end

  def sell_pets
    pets.each {|pet| pet.mood = "nervous"}
    pets.each {|pet| pet.owner = nil}
  end

end