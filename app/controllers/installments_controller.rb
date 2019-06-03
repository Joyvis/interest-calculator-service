# frozen_string_literal: true

class InstallmentsController < ApplicationController
  def create
    installment = PriceRules.calculate(installment_params)

    if installment.save
      render_success installment
    else
      render_error installment
    end
  end

  def show
    installment = Installment.find_by(uuid: params[:id])
    render_success installment
  end

  def destroy
    installment = Installment.find_by(uuid: params[:id])
    installment.destroy

    render_success installment
  end

  private

  def installment_params
    params.permit(:present_value, :number_of_installments,
                  :monthly_interest_rate)
  end
end
