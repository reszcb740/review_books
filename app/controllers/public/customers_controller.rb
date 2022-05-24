class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
   before_action :ensure_correct_customer, only: [:edit, :update]
  def show
    @customer = current_customer
    @books = @customer.books
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
     redirect_to customer_path(@customer.id), notice: "You have updated customer successfully."
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image, :introduction, :book_id, :is_deleted)
  end

  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      redirect_to customer_path(current_customer)
    end
  end
end
