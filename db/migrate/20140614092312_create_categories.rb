class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    create_table :categories_providers do |t|
      t.belongs_to :category
      t.belongs_to :provider
    end
  end

  def down
    drop_table :categories
    drop_table :categories_providers
  end
end
