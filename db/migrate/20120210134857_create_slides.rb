class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.text :body
      t.string :author
      t.timestamps
    end
  end
end
