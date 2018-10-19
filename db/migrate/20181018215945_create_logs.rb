class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :surf_spot
      t.integer :date
      t.text :discription
      t.string :swell_direction
      t.integer :swell_size
      t.string :conditions
      t.integer :wave_count
      t.string :image_url
      t.integer :surfer_id
    end
  end
end
