require 'active_support/core_ext/string/filters'

module ActiveRecord
  module Dowsing
    module Util
      def self.append_comment(sql)
        location = filter_stacktrace(caller).first
        "#{sql} /* #{location}#{app_name} */"
      end

      def self.app_name
        return unless Rails.application&.initialized? && Rails.configuration.x.activerecord_dowsing.with_app_name
        "##{Rails.application.class.parent_name.downcase}"
      end

      def self.filter_stacktrace(stack)
        @cleaner ||= ActiveSupport::BacktraceCleaner.new.tap do |cleaner|
          cleaner.add_filter   { |line| line.remove(Rails.root.to_s) }
          cleaner.add_filter   { |line| line.remove('*') } # Sanitize comment

          cleaner.add_silencer { |line| line =~ %r{activerecord-dowsing/lib} }
          cleaner.add_silencer { |line| line =~ /gems/ }
        end

        @cleaner.clean(stack)
      end
    end
  end
end
