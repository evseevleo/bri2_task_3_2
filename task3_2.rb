require 'pg'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :encoding => 'unicode',
  :adapter  => 'postgresql',
  :database => 'task3_development',
  :username => 'yevseyev',
  :password => '',
  :host     => 'localhost')

class NewProduct < ActiveRecord::Base
end
class Worker
  
  attr_reader :n  

  def initialize ( n = 1 )
    @n = n
  end

  def insert( str )
   # next_id = NewProduct.connection.execute( "SELECT nextval('new_products_id_seq')")[0]['nextval']
    arr = str.split(/\s+/)
    hash = { :title =>  arr[0], :description => arr[1], :price => arr[2]}
    NewProduct.create(hash)
  end

end

worker1 = Worker.new(10)
puts "Enter title, description and price of ne product(separated by space) \nRepeat #{worker1.n} times"
worker1.n.times do
  worker1.insert( gets.chomp )
end
