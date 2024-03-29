class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :website
      t.string :logo

      t.timestamps
    end
  end
end
