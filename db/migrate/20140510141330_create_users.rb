class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :password, null: false
      t.string :description
    end
  end
end
