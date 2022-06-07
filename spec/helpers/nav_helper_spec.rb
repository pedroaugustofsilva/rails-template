# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NavHelper, type: :helper do
  let(:user) { create(:user, photo: fixture_file_upload('spec/fixtures/fake_person.jpg')) }

  context 'with user_image_tag method' do
    it 'must return a a image tag with 8 as height and widht' do
      expect(helper.user_image_tag(user, false)).to include('-8')
    end

    it 'must return a a image tag with 10 as height and widht' do
      expect(helper.user_image_tag(user, true)).to include('-10')
    end
  end
end
