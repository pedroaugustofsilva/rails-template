# frozen_string_literal: true

class SaveMacro
  def self.perform
    task = lambda do |(ctx, flow_options), _|
      signal = ctx[:model].save ? Trailblazer::Activity::Right : Trailblazer::Activity::Left
      return signal, [ctx, flow_options]
    end

    {
      task:,
      id: 'macros.save_macro.perform'
    }
  end
end
