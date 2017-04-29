module ActiveRecord
  module Dowsing
    module Patch
      private

      def execute(sql, *args)
        super(Util.append_comment(sql), *args)
      end
    end
  end
end
