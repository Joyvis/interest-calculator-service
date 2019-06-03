# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Installment, type: :model do
  describe 'validating' do
    before { create(:installment) }

    context 'presence' do
      it { is_expected.to validate_presence_of(:present_value) }
      it { is_expected.to validate_presence_of(:number_of_installments) }
      it { is_expected.to validate_presence_of(:monthly_interest_rate) }
      it { is_expected.to validate_presence_of(:installment_value) }
      it { is_expected.to validate_uniqueness_of(:uuid) }
    end
  end
end
