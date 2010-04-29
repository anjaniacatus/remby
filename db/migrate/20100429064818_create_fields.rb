class CreateFields < ActiveRecord::Migration
  def self.up
    create_table :fields do |t|
      t.string :field_name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :fields
  end
end
