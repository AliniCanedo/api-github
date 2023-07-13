class CreateRepositories < ActiveRecord::Migration[7.0]
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :owner
      t.string :language
      t.integer :stars
      t.integer :forks

      t.timestamps
    end
  end
end
