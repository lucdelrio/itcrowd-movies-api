class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.date :release_year
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
