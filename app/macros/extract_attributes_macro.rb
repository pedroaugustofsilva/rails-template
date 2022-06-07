# frozen_string_literal: true

class ExtractAttributesMacro
  def self.perform(*attributes)
    task = lambda do |(ctx, flow_options), _|
      attributes.each { |attr| ctx[attr] = ctx[:params].delete(attr) }

      return Trailblazer::Activity::Right, [ctx, flow_options]
    end

    {
      task:,
      id: 'macros.extract_attributes.perform'
    }
  end
end
