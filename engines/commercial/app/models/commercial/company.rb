module Commercial
  class Company < ActiveRecord::Base
    belongs_to :state, class_name: "Information::State"
    belongs_to :city, class_name: "Information::City"
    
    validates :name, :cnpj, :state, :address, :address_complement, :cep, :telephone, presence: true
    validates :cnpj, cnpj: true
  end
end
