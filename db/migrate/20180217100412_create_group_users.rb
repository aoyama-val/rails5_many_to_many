class CreateGroupUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :group_users do |t|
      t.references  :group, index: true, foreign_key: { on_delete: :cascade }
      t.references  :user,  index: true, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
