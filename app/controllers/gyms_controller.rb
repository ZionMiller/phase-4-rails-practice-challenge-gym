class GymsController < ApplicationController

    def index
        render json: Gym.all
    end

    def show
        gym = find_gym
        render json: gym, status: 200
    end

    def update
        gym = find_gym
        gym.update!(gym_params)
        render json: gym, status: 202
    end

    def destroy
        find_gym.destroy
        head :no_content, status: :no_content
    end

    private

    def gym_params
        params.permit(:name, :address)
    end

    def find_gym
        Gym.find(params[:id])
    end


end
