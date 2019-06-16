require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get  root_url
    assert_response :success
  end

  test "should get home" do
    get root_url
    assert_response :success
    # 重复的内容可以写一个函数
    assert_select "title", "home | Ruby on Rails" 
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "help | Ruby on Rails" 
  end

  # 我是失败的测试例子
  test "shoulid get about" do
    get about_path
    assert_response :success
    assert_select "title", "about | Ruby on Rails" 
  end

  test "shoulid get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "contact | Ruby on Rails" 
  end
end
