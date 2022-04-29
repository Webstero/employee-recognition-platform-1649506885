module Admins
  class KudosController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_kudo, only: %i[show destroy]

    # GET /admins/kudos
    def index
      @kudos = Kudo.all.order(:id)
    end

    # GET /admins/kudos/1
    def show; end

    # GET /admins/kudos/new
    # def new
    #   @admins_kudo = Admins::Kudo.new
    # end

    # GET /admins/kudos/1/edit
    # def edit
    # end

    # POST /admins/kudos
    # def create
    #   @admins_kudo = Admins::Kudo.new(admins_kudo_params)

    #   if @admins_kudo.save
    #     redirect_to @admins_kudo, notice: 'Kudo was successfully created.'
    #   else
    #     render :new
    #   end
    # end

    # PATCH/PUT /admins/kudos/1
    # def update
    #   if @admins_kudo.update(admins_kudo_params)
    #     redirect_to @admins_kudo, notice: 'Kudo was successfully updated.'
    #   else
    #     render :edit
    #   end
    # end

    # DELETE /admins/kudos/1
    def destroy
      @kudo.destroy
      redirect_to admins_kudos_path, notice: 'Kudo was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_kudo
      @kudo = Kudo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kudo_params
      params.require(:kudo).permit(:title, :content, :giver_id, :receiver_id)
    end
  end
end
