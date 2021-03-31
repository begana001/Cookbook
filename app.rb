require_relative 'cookbook'
require_relative 'controller'
require_relative 'route'

cookbook = Cookbook.new
controller = Controller.new(cookbook)
route = Route.new(controller)

# start the app
route.run
