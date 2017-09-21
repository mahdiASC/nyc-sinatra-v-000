$:.unshift '.'
require 'config/environment'

use Rack::Static, :urls => ['/css'], :root => 'public' # Rack fix allows seeing the css folder.

if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending run `rake db:migrate` to resolve the issue.'
end


#LOAD ORDER MATTERS
use Rack::MethodOverride #good for patching and deleting
use LandmarksController
use FiguresController
run ApplicationController
