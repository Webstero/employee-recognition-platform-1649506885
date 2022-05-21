module Admins
  class KudosController < AdminController
    def index
      @kudos = Kudo.all.order(:created_at).includes(:company_value, :receiver, :giver)
    end

    def show
      set_kudo
    end

    def destroy
      set_kudo
      @kudo.destroy
      redirect_to admins_kudos_path, notice: 'Kudo was successfully destroyed.'
    end

    private

    def set_kudo
      @kudo = Kudo.find(params[:id])
    end

    def kudo_params
      params.require(:kudo).permit(:title, :content, :giver_id, :receiver_id, :company_value)
    end
  end
end
Add reference for kudos and company_value.