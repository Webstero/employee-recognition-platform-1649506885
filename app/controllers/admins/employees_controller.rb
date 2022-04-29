module Admins
  class EmployeesController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_employee, only: %i[show edit update destroy]

    def index
      @employees = Employee.all.order(:id)
    end

    def show; end

    def edit; end

    def update
      if @employee.update(employee_params.compact_blank)
        redirect_to admins_employees_path, notice: 'Employee was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @employee.destroy
      redirect_to admins_employees_path, notice: 'Employee was successfully destroyed.'
    end

    private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:email, :password, :id, :number_of_available_kudos)
    end
  end
end
