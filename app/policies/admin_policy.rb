# frozen_string_literal: true

# AdminPolicy
class AdminPolicy < Struct.new(:user, :admin)
  def insights?
    admin?
  end

  def kpis?
    admin?
  end

	private

	def admin?
		user.admin?
	end
end
