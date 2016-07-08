module Deal
	class ImageUploader < CarrierWave::Uploader::Base
	  
	  
    storage :fog  if Rails.env.production?
	  storage :file if Rails.env.development?
	  
	  def store_dir
	    'uploads/deal'
	  end

	  def extension_white_list
    	%w(jpg jpeg gif png)	
  	end
	end
end