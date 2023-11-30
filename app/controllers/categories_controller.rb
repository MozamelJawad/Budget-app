class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories
    @expense = Expense.all

    @total_amount = @expense.sum(:amount)
    @category_totals = calculate_totals
  end

  def show
    @category = Category.find_by(id: params[:id])
    @expenses = Expense.where(category_id: params[:id]).order(created_at: :desc)
    @total_amount = @expenses.sum(:amount)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params_category)
    @category.user_id = current_user.id
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def params_category
    params.require(:category).permit(:name, :icon)
  end

  def calculate_totals
    category_totals = {}

    @categories.each do |category|
      category_expenses = Expense.where(category_id: category.id)

      total = category_expenses.sum(:amount)
      category_totals[category.name] = total
    end

    category_totals
  end
end
