class CreateInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :infos do |t|
      t.integer :ord
      t.integer :val

      t.timestamps
    end
  end
end
