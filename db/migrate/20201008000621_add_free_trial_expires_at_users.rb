class AddFreeTrialExpiresAtUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :free_trial_expires_at, :datetime
  end
end
