class ApplicationController < ActionController::API

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

    
    def render_invalid(exception)
        render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found(exception)
        render json: { error: exception }, status: 404
    end

end
