class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = current_user.transactions.includes(:order).order(created_at: :desc)
  end

  def show
    @transaction = current_user.transactions.find(params[:id])
  end
end
