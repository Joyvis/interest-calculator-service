# frozen_string_literal: true

class Installment < ApplicationRecord
  validates_presence_of :present_value, :number_of_installments,
                        :monthly_interest_rate, :installment_value, :uuid
end
