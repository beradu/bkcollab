class AddTextToPins < ActiveRecord::Migration
  def change
    add_column :pins, :text, :text
  end
end
