class AddSecureTokenToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :secure_token, :integer
  end
end
