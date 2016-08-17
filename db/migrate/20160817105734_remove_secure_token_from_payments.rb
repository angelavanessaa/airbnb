class RemoveSecureTokenFromPayments < ActiveRecord::Migration
  def change
    remove_column :payments, :secure_token, :integer
  end
end
