# frozen_string_literal: true

module GenericConcept
  module Operation
    class Destroy < Trailblazer::Operation
      step Model(nil, :find_by, :id, not_found_terminus: true)
      step :destroy

      def destroy(ctx, ...)
        ctx[:model].destroy
      end
    end
  end
end
