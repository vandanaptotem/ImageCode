# use Rack::Cors do
#   allow do
#     origins 'localhost:3000', '127.0.0.1:3000', '192.168.2.16'
#             /http:\/\/192\.168\.0\.\d{1,3}(:\d+)?/
#     # regular expressions can be used here
#
#     # resource '/file/list_all/', :headers => 'x-domain-token'
#     resource '/get_case_title/*',
#              :methods => [:get, :post, :put, :delete, :options],
#              :headers => 'x-domain-token',
#              :expose  => ['Some-Custom-Response-Header'],
#              :max_age => 600
#     # headers to expose
#   end
#
#   allow do
#     origins '*'
#     resource '/get_case_title/*', :headers => :any, :methods => :get
#   end
# end