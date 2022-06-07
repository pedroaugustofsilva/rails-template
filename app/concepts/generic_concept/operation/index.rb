# frozen_string_literal: true

module GenericConcept
  module Operation
    class Index < Trailblazer::Operation
      step :set_pagination

      def set_pagination(ctx, model:, params:, **)
        paginate_params = params[:paginate_params]
        page = paginate_params[:page] || 1
        per_page = paginate_params[:per_page] || 25
        ctx[:model] = model.page(page).per(per_page)
      end
    end
  end
end
