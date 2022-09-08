class ClientsController < ApplicationController

    def index
        render json: Client.all
    end

    def show
        client = find_client
        render json: client.memberships, status: 404
    end

    def create
        client = Client.create!(client_params)
        render json: client
    end

    def update
        client = find_client
        client.update!(client_params)
        render json: client, status: 202
    end

    private

    def client_params
        params.permit(:name, :age)
    end

    def find_client
        Client.find(params[:id])
    end

end
