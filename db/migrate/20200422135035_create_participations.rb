class CreateParticipations < ActiveRecord::Migration[6.0]
  def change
    create_table :participations do |t|
      t.references :person, foreign_key: true
      t.references :movie, foreign_key: true
      t.integer :role, null: false
      t.datetime :deleted_at
      
      t.timestamps
    end
  end
end
