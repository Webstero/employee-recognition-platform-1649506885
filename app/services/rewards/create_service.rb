module Rewards
  class CreateService
    def call(reward:)
      reward.save!
    end
  end
end
