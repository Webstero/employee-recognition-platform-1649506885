module Admins
  class CompanyValuesController < AdminController
    before_action :set_company_value, only: %i[edit update destroy]

    def index
      @company_values = CompanyValue.all.order(:id)
    end

    def new
      @company_value = CompanyValue.new
    end

    def edit; end

    def create
      @company_value = CompanyValue.new(company_value_params)

      if @company_value.save
        redirect_to admins_company_values_path, notice: 'Company value was successfully created.'
      else
        render :new
      end
    end

    def update
      if @company_value.update(company_value_params)
        redirect_to admins_company_values_path, notice: 'Company value was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @company_value.destroy
      redirect_to admins_company_values_path, notice: 'Company value was successfully destroyed.'
    end

    private

    def set_company_value
      @company_value = CompanyValue.find(params[:id])
    end

    def company_value_params
      params.require(:company_value).permit(:title)
    end
  end
end
