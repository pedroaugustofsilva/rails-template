# frozen_string_literal: true

class TransactionMacro
  def self.call((ctx, flow_options), *, &)
    ActiveRecord::Base.transaction(&)
  rescue StandardError => e
    Rails.logger.error(I18n.t('macro.transaction_error', error: e.full_message))
    ctx[:transaction_error] = I18n.t('macro.transaction_error', error: e.message)
    [Trailblazer::Operation::Railway.fail!, [ctx, flow_options]]
  end
end
