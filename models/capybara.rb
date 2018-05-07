require_relative( '../db/sql_runner' )

class Capybara

  attr_reader( :admission, :age, :available, :id )
  attr_accessor( :name )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @admission = options['admission']
    @age = options['age']
    @available = options['available']
  end

  def save()
    sql = "INSERT INTO capybaras
    (
      name,
      admission,
      age,
      available
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @admission, @age, @available]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE capybaras SET (
    name,
    admission,
    age,
    available
    ) = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@name, @admission, @age, @available]
    SqlRunner.run(sql, values)
  end

  def delete()
  sql = "DELETE from capybaras WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM capybaras"
    results = SqlRunner.run( sql )
    return results.map { |hash| Capybara.new( hash ) }
  end

  def self.find(id)
    sql = "SELECT * FROM capybaras
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Capybara.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM capybaras"
    SqlRunner.run( sql )
  end

end