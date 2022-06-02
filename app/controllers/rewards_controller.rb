class RewardsController < ApplicationController
  before_action :authenticate_employee!

  def index
    @rewards = Reward.order(:created_at)
  end

  def show
    @reward = Reward.find(params[:id])
  end
end
