class AddReferencesUserToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :user_id, :integer, index: true
  end
end
