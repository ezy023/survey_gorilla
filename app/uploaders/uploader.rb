class Uploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    'public/pictures'
  end
end
