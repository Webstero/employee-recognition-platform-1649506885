module Kudos
  class CreateService
    def call(kudo:, employee:)
      kudo.giver = employee
      ActiveRecord::Base.transaction do
        kudo.save!
        update_available_kudos(giver: employee)
        update_earned_points(receiver: kudo.receiver)
      end
    end

    private

    def update_available_kudos(giver:)
      giver.decrease_available_kudos
    end

    def update_earned_points(receiver:)
      receiver.increase_earned_points
    end
  end
end
