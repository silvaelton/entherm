require 'csv'

class User < ActiveRecord::Base

  has_many :user_contracts, class_name: "Access::UserContract"
  accepts_nested_attributes_for :user_contracts, allow_destroy: true

  attr_accessor :current_password, :edit_form

  validates :email, email: true, presence: true 

  validates :current_password, presence: true, if: :profile_form?
  validate  :current_password_is_valid?, if: :profile_form?
  
  has_many :contracts, through: :user_contracts, class_name: "Commercial::Contract"
  has_many :orders, class_name: "Deal::Order"
  belongs_to :privilege
  
  enum user_type: ['simples', 'solicitante', 'administrador']


  private

  def profile_form?
    self.edit_form
  end

  def current_password_is_valid?
    if User.find(self.id).encrypted_password != self.current_password
      errors.add(:current_password, "Senha não confere")
    end
  end

end
