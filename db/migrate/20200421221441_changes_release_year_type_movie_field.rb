class ChangesReleaseYearTypeMovieField < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :release_year
    add_column :movies, :release_year, :integer, null: false
  end
end
