class AddOnboardingToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :onboarding, :integer, null: false, default: 0
    add_index :users, :onboarding
  end
end
