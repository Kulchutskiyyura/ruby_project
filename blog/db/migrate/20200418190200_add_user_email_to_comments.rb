class AddUserEmailToComments < ActiveRecord::Migration[5.2]
  def change
    change_table :posts do |t|
      t.string :categories
    end
  end
end
