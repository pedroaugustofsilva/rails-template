# frozen_string_literal: true

class ValidateModelMacro
  def self.perform
    task = lambda do |(ctx, flow_options), _|
      signal = ctx[:model].valid? ? Trailblazer::Activity::Right : Trailblazer::Activity::Left
      return signal, [ctx, flow_options]
    end

    {
      task:,
      id: 'macros.validate_macro.perform'
    }
  end
end
