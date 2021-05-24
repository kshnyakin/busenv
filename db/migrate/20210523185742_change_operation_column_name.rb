class ChangeOperationColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :operations, :type, :operation_type
  end
end
