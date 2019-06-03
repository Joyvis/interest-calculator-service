class CreateInstallments < ActiveRecord::Migration[5.2]
  def change
    create_table :installments do |t|
      t.float :present_value, null: false
      t.integer :number_of_installments, null: false
      t.float :monthly_interest_rate, null: false
      t.string :uuid, null: false
      t.timestamps
    end
  end
end
