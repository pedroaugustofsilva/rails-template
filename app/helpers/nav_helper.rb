# frozen_string_literal: true

module NavHelper
  def user_photo_tag(user, mobile = false)
    user.photo.representable? && user.photo.persisted? ? user_image_tag(user, mobile) : default_svg_tag(mobile)
  end

  def user_image_tag(user, mobile)
    height_size = mobile ? '10' : '8'
    image_tag(user.photo, class: "h-#{height_size} w-#{height_size} rounded-full inline-block")
  end

  def default_svg_tag(mobile)
    height_size = mobile ? '10' : '8'
    "<span class=\"inline-block h-#{height_size} w-#{height_size} rounded-full overflow-hidden bg-gray-100\">
                  <svg class=\"h-full w-full text-gray-300\" fill=\"currentColor\" viewBox=\"0 0 24 24\">
                    <path d=\"M24 20.993V24H0v-2.996A14.977 14.977 0 0112.004 15c4.904 0 9.26 2.354 11.996 5.993zM16.002 8.999a4 4 0 11-8 0 4 4 0 018 0z\" />
                  </svg>
                </span>"
  end
end
