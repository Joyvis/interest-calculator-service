# frozen_string_literal: true

class Installment < ApplicationRecord
  before_create :generate_uuid

  validates_presence_of :present_value, :number_of_installments,
                        :monthly_interest_rate

  validates_uniqueness_of :uuid

  validates :present_value, :number_of_installments, :monthly_interest_rate,
            numericality: { other_than: 0 }

  with_options if: :valid_until_now? do
    validates_presence_of :installment_value
  end

  private

  def generate_uuid
    self.uuid = SecureRandom.uuid if uuid.blank?
  end

  def valid_until_now?
    errors.details.size.zero?
  end
end
