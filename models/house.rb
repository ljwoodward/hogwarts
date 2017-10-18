require_relative('../db/sql_runner.rb')

class House

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
end
