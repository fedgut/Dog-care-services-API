class DropTodos2 < ActiveRecord::Migration[6.0]
  def change
    drop_table :todos
  end
end
