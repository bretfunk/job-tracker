class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :fname
      t.string :lname
      t.string :position
      t.string :email
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
