class GeneralSession
	include ActiveModel::Model

	attr_accessor :id, :email, :password

	validates :email, email: true, presence: true
	validates :password, presence: true


	validate :verify!

	private

	def verify!
		@user = ::User.where(email: self.email, encrypted_password: self.password)

		if @user.present?
			self.id = @user.first.id
		else
			errors.add(:email, "E-mail ou senha estão incorretas")
		end
	end
end