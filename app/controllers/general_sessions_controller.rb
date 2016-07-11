class GeneralSessionsController < ApplicationController
	layout 'session'

	def index
		redirect_to action: :new
	end

	def new
		@geral = ::GeneralSession.new
	end

	def create
		@geral = ::GeneralSession.new(set_params)

		if @geral.valid?
			session[:user_id] = @geral.id
			redirect_to dashboard.root_path
		else
			render action: :new
		end
	end

	def destroy
		session[:user_id] = nil

		redirect_to action: :new
	end

	private

	def set_params
		params.require(:general_session).permit(:email, :password)
	end
end