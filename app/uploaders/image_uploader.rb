# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
include Cloudinary::CarrierWave
version :standard do
  cloudinary_transformation width:600, height: 600, crop: :pad, background: 'black'
end

  version :cropped do
    cloudinary_transformation(
      transformation:
        [
          { crop: :crop, gravity: :custom },
          { width: 600, height: 600, crop: :fill },
        ]
    )
  end
end
