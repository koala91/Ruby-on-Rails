require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get  root_url
    assert_response :success
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    # 重复的内容可以写一个函数
    assert_select "title", "home | Ruby on Rails" 
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "help | Ruby on Rails" 
  end

  # 我是失败的测试例子
  test "shoulid get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "about | Ruby on Rails" 
  end
end
