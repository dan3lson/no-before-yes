class RequireFreeTrialExpiresAtUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :free_trial_expires_at, false
  end
end
