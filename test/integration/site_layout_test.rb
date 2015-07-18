require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  #this is some sort of voodoo magic, honestly.
  #actually "a[href=?]" simulates a url route and foo_path tests the actual route
  #root_path, count: 2 - both logo and 'Home' are routes back to '/' - this tests both instances
  
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
end