require 'sinatra'
require 'sinatra/contrib/all' if development?
require_relative 'models/order'
require 'json'

get '/' do 
  erb( :homepage )
end

get '/preorder' do
  @order = Order.new( params )
  @order.save()
  erb( :preorder )
end

post '/conformation' do
  erb( :conformation )
end

get '/conformation' do
  @orders = Order.all()
  erb( :conformation )
end