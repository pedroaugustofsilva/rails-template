# frozen_string_literal: true

class BaseConceptsController < ApplicationController
  def index
    run GenericConcept::Operation::Index, params: { paginate_params: }, model: model do |ctx|
      @model = ctx[:model]
      return render
    end
  end

  def show
    run GenericConcept::Operation::Show, params: find_param, 'model.class': model do |ctx|
      @model = ctx[:model]
      return render
    end
  end

  def create
    run GenericConcept::Operation::Create, params: params, 'model.class': model do |_ctx|
      return redirect_to show_url
    end

    render :new, status: :unprocessable_entity
  end

  def update
    run GenericConcept::Operation::Update, params: params, 'model.class': model do |ctx|
      @model = ctx[:model]
      return redirect_to show_url
    end

    render :edit, status: :unprocessable_entity
  end

  def destroy
    run GenericConcept::Operation::Destroy, params: find_param, 'model.class': model do |_ctx|
      return redirect_to index
    end
  end

  def new
    @model = model.new
  end

  def edit
    run GenericConcept::Operation::Show, params: find_param, 'model.class': model do |ctx|
      @model = ctx[:model]
      return render
    end
  end

  private

  def model
    raise 'You must implement the model'
  end

  def find_param
    { id: params.require(:id) }
  end

  def paginate_params
    params.permit(:page, :per_page)
  end
end
