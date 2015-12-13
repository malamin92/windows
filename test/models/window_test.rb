require 'test_helper'

class WindowTest < ActiveSupport::TestCase
  
  def setup
  	@window = Window.new(store_name: "Macys", location: "NYC")
  end

  test "store name should be present" do
  	@window.store_name = "     "
  	assert_not @window.valid?
  end

  test "store location should be present" do
  	@window.location = "     "
  	assert_not @window.valid?
  end

  test "store name should not be more that 80 chars" do
  	@window.store_name = "x" * 81
  	assert_not @window.valid?
  end

  test "store location should not be more that 80 chars" do
  	@window.location = "x" * 81
  	assert_not @window.valid?
  end
end
