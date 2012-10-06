class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :zipcode
      t.boolean :economy
      t.boolean :healthcare
      t.boolean :social_security

      t.timestamps
    end
  end
end
