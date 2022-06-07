# frozen_string_literal: true

module ApplicationHelper
  def nav_classes(...)
    if current_page?(...)
      'border-indigo-500 text-gray-900 inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium'
    else
      'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300 inline-flex items-center px-1 pt-1' \
        ' border-b-2 text-sm font-medium'
    end
  end

  def nav_mobile_classes(...)
    if current_page?(...)
      'bg-indigo-50 border-indigo-500 text-indigo-700 block pl-3 pr-4 py-2 border-l-4 text-base font-medium'
    else
      'border-transparent text-gray-600 hover:bg-gray-50 hover:border-gray-300 hover:text-gray-800 block pl-3 pr-4' \
        ' py-2 border-l-4 text-base font-medium'
    end
  end

  def flash_message_classes(flash_type)
    {
      notice: 'bg-green-400 border-l-4 border-green-700 text-white',
      error: 'bg-red-400 border-l-4 border-red-700 text-black',
      alert: 'bg-red-400 border-l-4 border-red-700 text-white'
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
