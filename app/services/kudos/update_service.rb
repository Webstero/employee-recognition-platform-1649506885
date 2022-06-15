module Kudos
  class InvalidOwnerException < StandardError; end

  class UpdateService
    def call(kudo:, employee:, **params)
      validate_kudo(kudo: kudo, employee: employee)
      kudo.update!(**params)
    end

    private

    def validate_kudo(kudo:, employee:)
      raise ::Kudos::InvalidOwnerException, 'You arent owner of Kudo' if kudo.giver_id != employee.id
    end
  end
end
