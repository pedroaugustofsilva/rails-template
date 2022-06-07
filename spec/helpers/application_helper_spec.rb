# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  context 'with nav_classes method' do
    it 'must return active classes' do
      allow(helper).to receive(:current_page?).and_return(true)
      classes = 'border-indigo-500 text-gray-900 inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium'
      expect(helper.nav_classes).to eq(classes)
    end

    it 'must return inactive classes' do
      allow(helper).to receive(:current_page?).and_return(false)
      classes = 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300 inline-flex items-center' \
                ' px-1 pt-1 border-b-2 text-sm font-medium'
      expect(helper.nav_classes).to eq(classes)
    end
  end

  context 'with nav_mobile_classes method' do
    it 'must return active classes' do
      allow(helper).to receive(:current_page?).and_return(true)
      classes = 'bg-indigo-50 border-indigo-500 text-indigo-700 block pl-3 pr-4 py-2 border-l-4 text-base font-medium'
      expect(helper.nav_mobile_classes).to eq(classes)
    end

    it 'must return inactive classes' do
      allow(helper).to receive(:current_page?).and_return(false)
      classes = 'border-transparent text-gray-600 hover:bg-gray-50 hover:border-gray-300 hover:text-gray-800 block' \
                ' pl-3 pr-4 py-2 border-l-4 text-base font-medium'
      expect(helper.nav_mobile_classes).to eq(classes)
    end
  end

  context 'with flash_message_classes method' do
    it 'must return notice classes' do
      classes = 'bg-green-400 border-l-4 border-green-700 text-white'
      expect(helper.flash_message_classes(:notice)).to eq(classes)
    end

    it 'must return error classes' do
      classes = 'bg-red-400 border-l-4 border-red-700 text-black'
      expect(helper.flash_message_classes(:error)).to eq(classes)
    end

    it 'must return alert classes' do
      classes = 'bg-red-400 border-l-4 border-red-700 text-white'
      expect(helper.flash_message_classes(:alert)).to eq(classes)
    end
  end
end
