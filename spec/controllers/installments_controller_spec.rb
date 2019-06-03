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

  describe 'destroying a installment' do
    before do
      delete :destroy, params: { id: installment_id }
    end

    let(:installments) { create_list(:installment, 2) }

    context 'with a valid uidd' do
      let(:installment_id) { installments.first.uuid }

      it 'installment was destroyed' do
        expect(Installment.all.size).to eq(1)
      end
    end
  end

  describe 'creating a installment' do
    before do
      post :create, params: installment_params
    end

    context 'with valid params' do
      let(:installment_params) { attributes_for(:installment) }

      it 'installment created' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      let(:installment_params) do
        attributes_for(:installment, present_value: 0)
      end

      it 'installment not created' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'without params' do
      let(:installment_params) { {} }

      it 'installment not created' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
