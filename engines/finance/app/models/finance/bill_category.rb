module Finance
  class BillCategory < ActiveRecord::Base

    validates :name, presence: true, uniqueness: true
  end
end
