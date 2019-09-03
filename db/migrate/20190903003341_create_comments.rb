class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :design, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
