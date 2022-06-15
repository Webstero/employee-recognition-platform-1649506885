module Kudos
  class InvalidOwnerException < StandardError; end

  class DestroyService
    def call(kudo:, employee:, skip_validation:)
      validate_kudo(kudo: kudo, employee: employee) if skip_validation == false
      ActiveRecord::Base.transaction do
        kudo.destroy!
        update_available_kudos(giver: employee)
        update_earned_points(receiver: kudo.receiver)
      end
    end

    private

    def validate_kudo(kudo:, employee:)
      raise ::Kudos::InvalidOwnerException, 'You aren`t owner of Kudo' if kudo.giver_id != employee.id
    end

    def update_available_kudos(giver:)
      giver.increase_available_kudos
    end

    def update_earned_points(receiver:)
      receiver.decrease_earned_points
    end
  end
end
