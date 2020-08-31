# frozen_string_literal: true

# AdminPolicy
class AdminPolicy < Struct.new(:user, :admin)
	FOUNDERS = %w[danelson@greatawait.com]

  def insights?
    owner?
  end

  def kpis?
    owner?
  end

	private

	def owner?
		FOUNDERS.include?(user.email)
	end
end