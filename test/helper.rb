require 'bundler/setup'
require 'minitest/autorun'
require 'active_record'
require 'hashed_attribute'

ActiveRecord::Base.extend HashedAttribute::Extension


class User < ActiveRecord::Base
  hashed_attribute :login_name
end

ActiveRecord::Base.establish_connection(:adapter => 'mysql2', :database => 'hashed_attr')

class MiniTest::Unit::TestCase
  def reset_tables
    ActiveRecord::Base.connection.create_table :users, :force => true do |t|
      t.string  :login_name
      t.integer :login_name_hash
    end
  end
end
