class AddUserToWindow < ActiveRecord::Migration
  def change
    add_reference :windows, :user, index: true, foreign_key: true
  end
end
