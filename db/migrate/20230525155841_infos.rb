class Infos < ActiveRecord::Migration[7.0]
  def change
    add_column :infos, :bud_ord, :integer
    add_column :infos, :bud_val, :integer
    add_column :infos, :py_ord, :integer
    add_column :infos, :py_val, :integer
  end
end
