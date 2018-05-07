require_relative( '../db/sql_runner' )

class Adoption

  attr_reader( :capybara_id, :owner_id, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @capybara_id = options['capybara_id'].to_i
    @owner_id = options['owner_id'].to_i
  end

  def save()
    sql = "INSERT INTO adoptions
    (
      capybara_id,
      owner_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@capybara_id, @owner_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM adoptions"
    results = SqlRunner.run( sql )
    return results.map { |adoption| Adoption.new( adoption ) }
  end

  def owner()
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [@owner_id]
    results = SqlRunner.run( sql, values )
    return Owner.new( results.first )
  end

  def capybara()
    sql = "SELECT * FROM capybaras
    WHERE id = $1"
    values = [@capybara_id]
    results = SqlRunner.run( sql, values )
    return Capybara.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM adoptions
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
