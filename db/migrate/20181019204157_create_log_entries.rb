class CreateLogEntries < ActiveRecord::Migration[5.2]
    def change
      create_table :log_entries do |t|
        t.string :surf_spot
        t.integer :date
        t.text :content
        t.string :swell_direction
        t.integer :swell_size
        t.string :conditions
        t.integer :wave_count
        t.string :image_url
        t.integer :surfer_id
      end
    end
end
