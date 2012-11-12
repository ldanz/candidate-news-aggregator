class ChangeSocialSecurityinUser < ActiveRecord::Migration
  def change
    rename_column :users, :social_security, :education
  end

end
