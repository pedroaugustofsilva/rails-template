# frozen_string_literal: true

module GenericConcept
  module Operation
    class Update < Trailblazer::Operation
      step Model(nil, :find_by, :id)
      step AssignAttributesMacro.perform
      step ValidateModelMacro.perform
      step SaveMacro.perform
    end
  end
end
