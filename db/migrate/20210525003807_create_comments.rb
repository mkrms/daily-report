class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment_name
      t.text :comment_content

      t.timestamps
    end
  end
end
