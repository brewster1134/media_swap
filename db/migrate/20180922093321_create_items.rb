class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, index: true
      t.string :name
      t.string :medium
      t.string :platform
      t.text :description

      t.timestamps
    end
  end
end
