module Admins
  class RewardsController < AdminController
    def index
      @rewards = Reward.all.order(:created_at)
    end

    def show
      reward
    end

    def new
      @reward = Reward.new
    end

    def edit
      reward
    end

    def create
      @reward = Reward.new(reward_params)
      if @reward.save
        redirect_to admins_rewards_path, notice: 'Reward was successfully created.'
      else
        render :new
      end
    end

    def update
      reward
      if @reward.update!(reward_params)
        redirect_to admins_rewards_path, notice: 'Reward was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      reward
      @reward.destroy
      redirect_to admins_rewards_path, notice: 'Reward was successfully destroyed.'
    end

    private

    def reward
      @reward = Reward.find(params[:id])
    end

    def reward_params
      params.require(:reward).permit(:title, :description, :price)
    end
  end
end
