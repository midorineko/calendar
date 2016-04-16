class AddForeignKeyToTodoLists < ActiveRecord::Migration
  def change
    add_column :todo_lists, :day_id, :integer
  end
end
