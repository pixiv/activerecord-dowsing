require 'spec_helper'

describe ActiveRecord::Dowsing do
  it 'has a version number' do
    expect(ActiveRecord::Dowsing::VERSION).not_to be nil
  end

  class DummyAdapter
    prepend ActiveRecord::Dowsing::Patch

    def execute(sql, name = nil)
      sql
    end
  end

  it 'returns caller-contained sql' do
    sql = 'SELECT `id` FROM `foo`'
    adapter = DummyAdapter.new
    expect(adapter.__send__(:execute, sql)).to match(%r{#{sql} /\* #{__FILE__}:\d+:in .+ */})
  end
end
