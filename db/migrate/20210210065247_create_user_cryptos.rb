class CreateUserCryptos < ActiveRecord::Migration[6.1]
  def change
    create_table :user_cryptos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :crypto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
