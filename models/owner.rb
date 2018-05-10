require_relative( '../db/sql_runner' )

class Owner

  attr_reader( :name, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO owners
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def delete()
    sql = "DELETE from owners WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def capybaras()
    sql = "SELECT capybaras.*
    FROM capybaras
    INNER JOIN adoptions
    ON adoptions.capybara_id = capybaras.id
    WHERE adoptions.owner_id = $1"
    values = [@id]
    capybara_data = SqlRunner.run(sql, values)
    capybaras = Capybara.map_items(capybara_data)
    return capybaras
  end

  def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run( sql )
    return results.map { |hash| Owner.new( hash ) }
  end

  def self.find(id)
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Owner.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM owners"
    SqlRunner.run( sql )
  end

  def self.map_items(owner_hashes)
    result = owner_hashes.map {|owner_hash| Owner.new(owner_hash)}
    return result
  end

end
