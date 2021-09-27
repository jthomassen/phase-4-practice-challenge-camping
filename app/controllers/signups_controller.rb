class SignupsController < ApplicationController

    def create
        signup = Signup.create(signup_params)
        if signup.valid?
            render json: signup, include: :activity, status: :created 
        else
            render json: { errors: signup.errors }, status: :unprocessable_entity
        end
    end

    private

    def signup_params
        params.permit(:time, :activity_id, :camper_id)
    end
end
