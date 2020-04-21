class AddFieldsNotNullableRestriction < ActiveRecord::Migration[6.0]
  def change
    change_column_null :movies, :title, false
    change_column_null :movies, :release_year, false
    change_column_null :people, :first_name, false
    change_column_null :people, :last_name, false
  end
end
