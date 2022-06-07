# frozen_string_literal: true

module GenericConcept
  module Operation
    class Show < Trailblazer::Operation
      step Model(nil, :find_by, :id)
    end
  end
end
