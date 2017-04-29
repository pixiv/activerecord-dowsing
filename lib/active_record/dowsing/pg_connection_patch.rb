module ActiveRecord
  module Dowsing
    module PgConnectionPatch
      # https://bitbucket.org/ged/ruby-pg/src/050a996456b14e1086581b79b391f37af999d414/ext/pg_connection.c?at=default&fileviewer=file-view-default
      %i(
        async_exec
        exec_params
        send_query
      ).each do |method_name|
        module_eval(<<-INSERT_CALLER_LOCAION, __FILE__, __LINE__ + 1)
          def #{method_name}(sql, *)
            sql = Util.append_comment(sql)
            super
          end
        INSERT_CALLER_LOCAION
      end

      %i(
        prepare
        send_prepare
      ).each do |method_name|
        module_eval(<<-INSERT_CALLER_LOCAION, __FILE__, __LINE__ + 1)
          def #{method_name}(_, sql, *)
            sql = Util.append_comment(sql)
            super
          end
        INSERT_CALLER_LOCAION
      end
    end
  end
end
