require_relative('../db/sql_runner.rb')

class House

  attr_reader(:id, :name, :logo)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @logo = options['logo']
  end

  def save()
    sql = "INSERT INTO houses
  (
    name,
    logo
    )
    VALUES
    (
      $1 ,$2
      )
    RETURNING *"
    values = [@name, @logo]
    house_data = SqlRunner.run(sql, values)
    @id = house_data[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM houses"
    values = []
    all_houses = SqlRunner.run(sql, values)
    result = all_houses.map{|house| House.new(house)}
    return result
  end


  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run(sql, values)
    result = House.new(house[0])
    return result
  end




end
