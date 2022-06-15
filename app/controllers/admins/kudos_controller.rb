module Admins
  class KudosController < AdminController
    def index
      @kudos = Kudo.all.order(:created_at).includes(:company_value, :receiver, :giver)
    end

    def show
      kudo
    end

    def destroy
      ::Kudos::DestroyService.new.call(kudo: kudo, employee: kudo.giver, skip_validation: true)
      flash[:notice] = 'Kudo was successfully destroyed.'
      redirect_to admins_kudos_path
    rescue ActiveRecord::RecordInvalid => e
      flash[:error] = e.to_s
      redirect_to admins_kudos_path
    end

    private

    def kudo
      @kudo = Kudo.find(params[:id])
    end

    def kudo_params
      params.require(:kudo).permit(:title, :content, :giver_id, :receiver_id, :company_value)
    end
  end
end
