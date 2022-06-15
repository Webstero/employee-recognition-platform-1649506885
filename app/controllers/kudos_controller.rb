class KudosController < ApplicationController
  before_action :authenticate_employee!

  def index
    @kudos = Kudo.all.includes(:company_value, :receiver, :giver)
  end

  def show
    kudo
  end

  def new
    form_params
  end

  def edit
    kudo
    form_params
  end

  def create
    @kudo = Kudo.new(kudo_params)
    ::Kudos::CreateService.new.call(kudo: @kudo, employee: current_employee)
    flash[:notice] = 'Kudo was successfully created.'
    redirect_to kudos_path
  rescue ActiveRecord::RecordInvalid => e
    flash[:error] = e.to_s
    form_params
    render :new
  end

  def update
    ::Kudos::UpdateService.new.call(kudo: kudo, employee: current_employee, **kudo_params.to_unsafe_hash.symbolize_keys)
    flash[:notice] = 'Kudo was successfully updated.'
    redirect_to action: 'show', id: params[:id]
  rescue ActiveRecord::RecordInvalid => e
    flash[:error] = e.to_s
    form_params
    render :edit
  rescue ::Kudos::InvalidOwnerException => e
    flash[:error] = e.to_s
    redirect_to action: 'show', id: params[:id]
  end

  def destroy
    ::Kudos::DestroyService.new.call(kudo: kudo, employee: current_employee, skip_validation: false)
    flash[:notice] = 'Kudo was successfully destroyed.'
    redirect_to kudos_path
  rescue ActiveRecord::RecordInvalid, ::Kudos::InvalidOwnerException => e
    flash[:error] = e.to_s
    redirect_to kudos_path
  end

  private

  def kudo
    @kudo = Kudo.find(params[:id])
  end

  def kudo_params
    params.require(:kudo).permit(:title, :content, :receiver_id, :company_value_id)
  end

  def form_params
    @available_employees = Employee.where.not(id: current_employee.id)
    @company_values = CompanyValue.all
  end
end
