# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  validates :photo, blob: { content_type: %w[image/png image/jpg image/jpeg], size_range: 1..(5.megabytes) }
end
