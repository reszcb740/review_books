class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
    @customer = Customer.find(params[:id])
    @books = @customer.books
    @book = Book.new
  end

  def edit
    @customer = current_customer
    @customer = Customer.find(params[:id])
    @customer == current_customer
  end

  def update
    @customer = Customer.find([:id])
    @customer.update(customer_params)
    redirect_to customer_path(current_customer.id)
  end

  def unsubscribe
  end

  def withdraw
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :introduction, :book_id, :is_deleted)
  end
end
