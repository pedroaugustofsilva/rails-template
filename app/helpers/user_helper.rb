# frozen_string_literal: true

module UserHelper
  def photo_url(user)
    user.photo.representable? && user.photo.persisted? ? url_for(user.photo) : ''
  end
end
