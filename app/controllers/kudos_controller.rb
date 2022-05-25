class KudosController < ApplicationController
  before_action :authenticate_employee!

  def index
    @kudos = Kudo.all.includes(:company_value, :receiver, :giver)
  end

  def show
    kudo
  end

  def new
    @kudo = Kudo.new
    form_params
  end

  def edit
    kudo
    form_params
  end

  def create
    @kudo = Kudo.new(kudo_params)
    @kudo.giver = current_employee
    if @kudo.save
      redirect_to kudos_path, notice: 'Kudo was successfully created.'
    else
      form_params
      render :new
    end
  end

  def update
    kudo
    if @kudo.giver_id != current_employee.id
      redirect_to kudos_url, notice: 'You aren`t owner of Kudo.'
    elsif @kudo.update(kudo_params)
      redirect_to @kudo, notice: 'Kudo was successfully updated.'
    else
      form_params
      render :edit
    end
  end

  def destroy
    kudo
    if @kudo.giver_id == current_employee.id
      @kudo.destroy
      redirect_to kudos_url, notice: 'Kudo was successfully destroyed.'
    else
      redirect_to kudos_url, notice: 'You aren`t owner of Kudo.'
    end
  end

  private

  def kudo
    @kudo = Kudo.find(params[:id])
  end

  def kudo_params
    params.require(:kudo).permit(:title, :content, :giver_id, :receiver_id, :company_value_id)
  end

  def form_params
    @available_employees = Employee.where.not(id: current_employee.id)
    @company_values = CompanyValue.all
  end
end
