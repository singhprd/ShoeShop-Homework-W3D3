require 'pg'

class Order

  attr_reader :first_name, :last_name, :quantity, :size

    def initialize( options )
      @first_name = options['first_name']
      @last_name = options['last_name']
      @quantity = options['quantity'].to_i
      @size = options['size'].to_i
    end

    def save
      db = PG.connect( {dbname: 'shoeshop', host: 'localhost' } )
      sql = "INSERT INTO shop (
      first_name,
      last_name,
      quantity,
      size) VALUES ( 
      '#{@first_name}',
      '#{@last_name}',
      '#{@quantity}',
      '#{@size}'
      )"
      db.exec( sql )
      db.close
    end

    def self.all()
      db = PG.connect( {dbname: 'shoeshop', host: 'localhost' } )
      sql = "SELECT * FROM shop"
      orders = db.exec( sql )
      result = orders.map {
    |order| Order.new( order ) }
    db.close
      return result 
    end

end