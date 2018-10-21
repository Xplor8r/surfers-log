class CreateLogEntries < ActiveRecord::Migration[5.2]
    def change
      create_table :log_entries do |t|
        t.string :surf_spot
        t.string :date
        t.text :content
        t.string :swell_direction
        t.string :swell_size
        t.string :conditions
        t.string :wave_count
        t.string :image_url
        t.integer :surfer_id
      end
    end
end
