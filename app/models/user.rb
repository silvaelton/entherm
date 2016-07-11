require 'csv'

class User < ActiveRecord::Base

  has_many :user_contracts, class_name: "Access::UserContract"
  accepts_nested_attributes_for :user_contracts, allow_destroy: true
  
  has_many :contracts, through: :user_contracts, class_name: "Commercial::Contract"
  has_many :orders, class_name: "Deal::Order"
  belongs_to :privilege
  
  enum user_type: ['simples', 'solicitante', 'administrador']

end
