class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :games, :PEGI, :pegi
  end

  def self.down
  end
end
