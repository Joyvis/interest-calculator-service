# frozen_string_literal: true

class PriceRules
  attr_reader :installment

  def self.calculate(installment_attributes)
    installment = Installment.new(installment_attributes)
    installment.valid?

    return installment unless valid_installment?(installment)
    new(installment).calculate
  end

  def initialize(installment)
    @installment = installment
  end

  def calculate
    installment.installment_value = calculate_installment

    installment
  end

  private

  def calculate_installment
    calc = (1 + installment.monthly_interest_rate)
    calc = calc ** installment.number_of_installments
    calc = 1 - ( 1 / calc )
    calc = installment.monthly_interest_rate / calc

    (installment.present_value * calc).round(2)
  end

  def self.valid_installment?(installment)
    required_fields = [:present_value, :number_of_installments,
                       :monthly_interest_rate]
    !required_fields.any? do |field|
      installment.errors.details.include?(field)
    end
  end
end
