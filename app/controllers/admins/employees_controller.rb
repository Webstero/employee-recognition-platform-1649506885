module Admins
  class EmployeesController < AdminController
    def index
      @employees = Employee.all.order(:created_at)
    end

    def show
      set_employee
    end

    def edit
      set_employee
    end

    def update
      set_employee
      if @employee.update(employee_params.compact_blank)
        redirect_to admins_employees_path, notice: 'Employee was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      set_employee
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
