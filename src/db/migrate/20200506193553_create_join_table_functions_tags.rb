class CreateJoinTableFunctionsTags < ActiveRecord::Migration[6.0]
  def change
    create_join_table :functions, :tags do |t|
      t.index [:function_id, :tag_id]
      # t.index [:tag_id, :function_id]
    end
  end
end
