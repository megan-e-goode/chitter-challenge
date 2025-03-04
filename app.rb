require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/peep-form' do
    erb :peep_form
  end

  post '/create-peep' do
    peep = Peep.new(params[:name], params[:content])
    peep.create
    redirect '/'
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/register' do
    User.register(params[:name], params[:username], params[:password])
    redirect '/success'
  end

  get '/success' do
    erb :success
  end
end
