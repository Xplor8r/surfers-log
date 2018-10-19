class CreateSurfers < ActiveRecord::Migration
  def change
    create_table :surfers do |t|
      t.string :surfername
      t.string :email
      t.string :password_digest
    end
  end
end
