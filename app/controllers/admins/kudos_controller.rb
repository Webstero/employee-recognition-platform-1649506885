module Admins
  class KudosController < AdminController
    def index
      @kudos = Kudo.all.order(:created_at).includes(:company_value, :receiver, :giver)
    end

    def show
      kudo
    end

    def destroy
      kudo
      @kudo.destroy
      redirect_to admins_kudos_path, notice: 'Kudo was successfully destroyed.'
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
