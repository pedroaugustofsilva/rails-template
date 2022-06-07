# frozen_string_literal: true

class AssignAttributesMacro
  def self.perform
    task = lambda do |(ctx, flow_options), _|
      ctx[:model].assign_attributes(ctx[:params])

      return Trailblazer::Activity::Right, [ctx, flow_options]
    end

    {
      task:,
      id: 'macros.assign_attributes.perform'
    }
  end
end
