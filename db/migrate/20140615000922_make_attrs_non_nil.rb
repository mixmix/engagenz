class MakeAttrsNonNil < ActiveRecord::Migration
  def change
    change_column_default :providers, :description, ''
    change_column_default :providers, :address,  ''
    change_column_default :providers, :phone_number,  ''
    change_column_default :providers, :email,  ''
    change_column_default :providers, :website,  ''
  end
end
