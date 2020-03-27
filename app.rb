require "sinatra"                                                               
require "sinatra/reloader" if development?                                      
require "sequel"                                                                
require "logger"                                                                
require "twilio-ruby"                                                           
require "bcrypt"   
require "geocoder"  

connection_string = ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/development.sqlite3"  #
DB ||= Sequel.connect(connection_string)                                        
DB.loggers << Logger.new($stdout) unless DB.loggers.size > 0                    
def view(template); erb template.to_sym; end                                    
use Rack::Session::Cookie, key: 'rack.session', path: '/', secret: 'secret'     
before { puts; puts "--------------- NEW REQUEST ---------------"; puts }       
after { puts; }                                                                 
#######################################################################################

# Code starts

get "/" do
    view "autocomplete"
end