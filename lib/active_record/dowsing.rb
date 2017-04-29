require 'rails'
require 'active_record/dowsing/version'
require 'active_record/dowsing/railtie'

module ActiveRecord
  module Dowsing
    autoload :Util, 'active_record/dowsing/util'
    autoload :Patch, 'active_record/dowsing/patch'
    autoload :PgConnectionPatch, 'active_record/dowsing/pg_connection_patch'
  end
end
