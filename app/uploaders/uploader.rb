class Uploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "/photos"
  end

  def cache_dir
    '/photos'
  end
end
