class AddGroupsToUserGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_groups, :group, foreign_key: true
    add_reference :user_groups, :user, foreign_key: true
  end
end
