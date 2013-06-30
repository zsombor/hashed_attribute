require 'helper'


class HashedAttributeTest < MiniTest::Unit::TestCase

  def setup
    reset_tables
  end

  def test_appends_hashed_attribute_to_scope
    expected_sql = "SELECT `users`.* FROM `users`  WHERE `users`.`login_name` = 'long_name' AND `users`.`login_name_hash` = 263551421"
    assert_equal(expected_sql,
                 User.scoped_by_login_name('long_name').to_sql)
  end

  def test_hashed_column_is_kept_in_sync
    u = User.create login_name: 'New User'
    assert_equal 154920269, u.login_name_hash
    assert_equal u, User.find_by_login_name('New User')

    u.login_name = 'Something Else'
    u.save!
    assert_equal 104301196, u.login_name_hash
    assert_equal u, User.find_by_login_name('Something Else')
  end
end
