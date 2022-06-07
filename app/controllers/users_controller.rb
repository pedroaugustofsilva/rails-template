# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    run GenericConcept::Operation::Index, params: { paginate_params: }, model: User do |ctx|
      @model = ctx[:model]
      return render
    end
  end

  def show
    run GenericConcept::Operation::Show, params: find_param, 'model.class': User do |ctx|
      @model = ctx[:model]
      return render :show, status: @model.present? ? :ok : :not_found
    end
  end

  def create
    run GenericConcept::Operation::Create, params: user_params, 'model.class': User do |ctx|
      return redirect_to user_path(ctx[:model])
    end

    render :new, status: :unprocessable_entity
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?

    run GenericConcept::Operation::Update, params: user_params.merge(find_param), 'model.class': User do |ctx|
      return redirect_to user_path(ctx[:model])
    end

    render :edit, status: :unprocessable_entity
  end

  def destroy
    run GenericConcept::Operation::Destroy, params: find_param, 'model.class': User do |_ctx|
      flash[:notice] = I18n.t('controllers.notices.destroyed', name: User.name)
      return redirect_to users_path
    end
  end

  def new
    @model = User.new
  end

  def edit
    run GenericConcept::Operation::Show, params: find_param, 'model.class': User do |ctx|
      @model = ctx[:model]
      return render
    end
  end

  private

  def find_param
    { id: params.require(:id) }
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :photo)
  end

  def paginate_params
    params.permit(:page, :per_page)
  end
end
