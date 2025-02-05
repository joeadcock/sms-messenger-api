class AddSidAndStatusToMessages < ActiveRecord::Migration[8.0]
  def change
    add_column :messages, :sid, :string
    add_column :messages, :status, :string
  end
end
