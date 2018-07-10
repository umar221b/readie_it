class CreateReadieReads < ActiveRecord::Migration[5.1]
  def change
    create_table :readie_reads do |t|
      t.references :readie, foreign_key: true, index: true

      t.timestamps
    end
  end
end
