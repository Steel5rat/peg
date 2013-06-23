class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :body
      t.boolean :is_important
      t.string :keywords

      t.timestamps
    end
  end
end
