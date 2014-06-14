class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string  :name
      t.text    :description
      t.string  :address
      t.string  :phone_number
      t.string  :email
      t.string  :website

      t.timestamps
    end
  end
end
