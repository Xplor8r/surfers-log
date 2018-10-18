class CreateSurfers < ActiveRecord::Migration[5.2]
  def change
    create_table :surfers do |t|
      t.string :surfername
      t.string :email
      t.string :password_digest
    end
  end
end
