module Rewards
  class UpdateService
    def call(reward:, **params)
      reward.update!(**params)
    end
  end
end
