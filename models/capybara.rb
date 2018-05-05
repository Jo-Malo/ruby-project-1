require_relative( '../db/sql_runner' )

class Capybara

  attr_reader( :name, :admission, :age, :available )

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

end
