# frozen_string_literal: true

module GenericConcept
  module Operation
    class Create < Trailblazer::Operation
      step Model()
      step AssignAttributesMacro.perform
      step ValidateModelMacro.perform
      step SaveMacro.perform
    end
  end
end
