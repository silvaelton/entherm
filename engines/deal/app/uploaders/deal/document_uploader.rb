module Deal
	class DocumentUploader < CarrierWave::Uploader::Base
	  
    storage :fog  if Rails.env.production?
	  storage :file if Rails.env.development?

	  def store_dir
	    'uploads/deal/document'
	  end

	end
end