# frozen_string_literal: true

FactoryBot.define do
  factory :installment do
    present_value { 1000.00 }
    number_of_installments { 4 }
    monthly_interest_rate { 0.03 }
    installment_value { 269.03 }
    uuid { 'B62C624E-A805-11E5-8C4A-50E44124FF49' }
  end
end
