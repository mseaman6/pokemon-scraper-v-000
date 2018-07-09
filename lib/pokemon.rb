class Pokemon

  @@all = []
  attr_accessor :name, :type, :id

  def initialize(name:, type:, db:)
    @name = name
    @type = type
    @id = id
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    :name <= new_pokemon[1]
    :type <= new_pokemon[2]
    :id <= new_pokemon[0]
    self.new(:name, :type, :id, db)
  end

end
