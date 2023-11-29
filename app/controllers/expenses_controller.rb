class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def new
    @expense = Expense.new
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @expense = Expense.new(params_expense)
    @expense.author = current_user
    if @expense.save
      redirect_to category_path(@expense.category_id)
    else
      render :new
    end
  end

  def params_expense
    params.require(:expense).permit(:name, :amount, :category_id)
  end

end
