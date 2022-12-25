class RenameIntrodutitonColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :introdutiton, :introduction
  end
end
