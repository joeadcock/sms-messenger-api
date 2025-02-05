class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.string :message
      t.string :phone
      t.datetime :sent_at

      t.timestamps
    end
  end
end
