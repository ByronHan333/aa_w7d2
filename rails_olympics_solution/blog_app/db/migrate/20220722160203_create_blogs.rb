class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :author, null: false, foreign_key: { to_table: :users }, index: false

      t.timestamps
    end
    add_index :blogs, %i[ author_id title ], unique: true
  end
end
