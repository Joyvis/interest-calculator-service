# frozen_string_literal: true

class InstallmentsController < ApplicationController
  def create
  end

  def show
    installment = Installment.find_by(uuid: params[:id])
  end

  def destroy
    installment = Installment.find_by(uuid: params[:id])
  end

  private

  def installment_params
    params.permit(:present_value, :number_of_installments,
                  :monthly_interest_rate)
  end
end
