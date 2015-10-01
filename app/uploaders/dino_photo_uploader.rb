class DinoPhotoUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    ActionController::Base.helpers.asset_path(
      "assets/images/fallback/" + [nil, "cute-dinosaur.png"].compact.join('_'))
  end
end
