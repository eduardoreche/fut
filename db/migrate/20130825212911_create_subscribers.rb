class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :accept_terms

      t.timestamps
    end
  end
end
