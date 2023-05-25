class Adddatetotable < ActiveRecord::Migration[7.0]
  def change

    add_column :infos, :date, :date
  end
end
