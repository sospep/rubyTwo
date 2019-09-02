class DropCommentsTable < ActiveRecord::Migration[5.1]
    def up
      drop_table :comments
    end
  
    def down
      raise ActiveRecord::IrreversibleMigration
    end
end
