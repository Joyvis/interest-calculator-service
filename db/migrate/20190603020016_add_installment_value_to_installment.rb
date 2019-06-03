class AddInstallmentValueToInstallment < ActiveRecord::Migration[5.2]
  def change
    add_column :installments, :installment_value, :float
    change_column :installments, :installment_value, :float, null: false
  end
end
