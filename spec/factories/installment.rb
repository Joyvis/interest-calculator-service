# frozen_string_literal: true

FactoryBot.define do
  factory :installment do
    present_value { 1000.00 }
    number_of_installments { 4 }
    monthly_interest_rate { 0.03 }
    installment_value { 269.03 }
  end
end
