# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resouce)
    public_customer_path(@customer.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

  # 退会しているかを判断するメソッド
  def customer_state
    ## [処理内容1] 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(name: params[:customer][:name])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    ## [処理内容2] 取得したアカウントをパスワードと入力されたパスワードが一致てるか判別
    if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted
      redirect_to new_customer_registration_path
      ## [処理内容3]
    end
  end
end
