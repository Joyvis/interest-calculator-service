# frozen_string_literal: true

class InstallmentSerializer < ActiveModel::Serializer
  attributes :present_value, :number_of_installments,
             :monthly_interest_rate, :installment_value
  attribute :uuid, key: :id
end
