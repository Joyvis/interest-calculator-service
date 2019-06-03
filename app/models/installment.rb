# frozen_string_literal: true

class Installment < ApplicationRecord
  before_create :generate_uuid

  validates_presence_of :present_value, :number_of_installments,
                        :monthly_interest_rate, :installment_value

  validates_uniqueness_of :uuid

  validates :present_value, :number_of_installments, :monthly_interest_rate,
            numericality: { other_than: 0 }

  private

  def generate_uuid
    self.uuid = SecureRandom.uuid if uuid.blank?
  end
end
