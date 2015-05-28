class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :username
      t.string  :company
      t.string  :homepage
      t.integer :follower_count
      t.integer :following_count
     end
  end
end
