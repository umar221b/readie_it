class CreateReadies < ActiveRecord::Migration[5.1]
  def change
    create_table :readies do |t|
      t.string :token, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
