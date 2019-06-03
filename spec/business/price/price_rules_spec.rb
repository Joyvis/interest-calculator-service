require 'rails_helper'

describe PriceRules, type: :business do
  describe '.calculate' do
    subject { described_class.calculate(installment_params) }

    context 'with valid params' do
      let(:installment_params) do
        { present_value: 1000, number_of_installments: 5,
          monthly_interest_rate: 0.03 }
      end

      it 'installment calculated' do
        expect(subject.valid?).to be_truthy
        expect(subject.installment_value).to eq(218.35)
      end
    end

    context 'with invalid params' do
      let(:installment_params) { {} }

      it 'installment calculated' do
        expect(subject.valid?).to be_falsey
      end
    end
  end
end
