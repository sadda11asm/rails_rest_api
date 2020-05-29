class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :key, unique: true
      t.string :text

    end
  end
end
