module Admins
  class EmployeesController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_employee, only: %i[show edit update destroy]

    # GET /admins/kudos
    def index
      @employees = Employee.all.order(:id)
    end

    # GET /admins/kudos/1
    def show; end

    # GET /admins/kudos/new
    # def new
    #   @admins_kudo = Admins::Kudo.new
    # end

    # GET /admins/kudos/1/edit
    def edit; end

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

    # PATCH/PUT /admins/employee/1
    def update
      if @employee.update(employee_params.compact_blank)
        redirect_to admins_employees_path, notice: 'Employee was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /admins/kudos/1
    def destroy
      @employee.destroy
      redirect_to admins_employees_path, notice: 'Employee was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:email, :password, :id, :number_of_available_kudos)
    end
  end
end
