class Pokemon

  @@all = []
  attr_accessor :name, :type, :id, :db

  def initialize(name:, type:, id:, db:)
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
    name_from_id = new_pokemon[1]
    type_from_id = new_pokemon[2]
    id_from_id = new_pokemon[0]
    self.new(name: name_from_id, type: type_from_id, id: id_from_id, db: db)
  end

  def alter_hp(new_hp)
    
  end

end
