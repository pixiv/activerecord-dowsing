module ActiveRecord
  module Dowsing
    class Railtie < ::Rails::Railtie
      initializer 'ActiveRecord::Dowsing patch' do
        next unless Rails.configuration.x.activerecord_dowsing.enabled

        ActiveSupport.on_load :active_record do
          configuration = ActiveRecord::Base.connection_config
          resolver = ActiveRecord::ConnectionAdapters::ConnectionSpecification::Resolver.new({})
          adapter_method = resolver.spec(configuration).adapter_method
          adapter = ActiveRecord::Base.public_send(adapter_method, configuration)

          if defined?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter) && adapter.is_a?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
            PG::Connection.prepend(ActiveRecord::Dowsing::PgConnectionPatch)
          elsif defined?(ActiveRecord::ConnectionAdapters::Mysql2Adapter) && adapter.is_a?(ActiveRecord::ConnectionAdapters::Mysql2Adapter)
            adapter.class.prepend(ActiveRecord::Dowsing::Patch)
          end
        end
      end
    end
  end
end
