class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :description
      t.date :release_date
      t.string :requirements
      t.string :genre
      t.string :PEGI
      t.string :producent
    end
  end
end
