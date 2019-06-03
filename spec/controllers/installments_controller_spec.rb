# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InstallmentsController, type: :controller do
  describe 'showing a installment' do
    before do
      get :show, params: { id: installment_id }
    end

    subject { JSON.parse(response.body, symbolize_names: true) }

    context 'with a valid uuid' do
      let(:installment_id) { create(:installment).uuid }

      it 'installment was found' do
        is_expected.not_to be_empty
      end

      it 'installment has all requireds keys' do
        is_expected.to have_key(:present_value)
        is_expected.to have_key(:number_of_installments)
        is_expected.to have_key(:monthly_interest_rate)
        is_expected.to have_key(:installment_value)
        is_expected.to have_key(:id)
      end
    end

    context 'with a invalid uuid' do
      let(:installment_id) { 'abc' }

      it 'installment was not found' do
        is_expected.to be_empty
      end
    end
  end
end
