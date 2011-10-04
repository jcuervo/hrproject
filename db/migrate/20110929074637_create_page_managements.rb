class CreatePageManagements < ActiveRecord::Migration
  def change
    create_table :page_managements do |t|
      t.string :site
      t.string :title
      t.boolean :reverse, :null => false, :default => true
      t.string :description
      t.string :keywords
      t.string :permalink
      
      t.timestamps
    end
  end
end
