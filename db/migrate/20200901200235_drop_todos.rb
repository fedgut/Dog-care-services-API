class DropTodos < ActiveRecord::Migration[6.0]
  def down
    drop_table :todos
  end
end
