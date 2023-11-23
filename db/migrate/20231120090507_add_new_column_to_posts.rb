class AddNewColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :date, :date
    add_column :posts, :alphanumeric, :string
    add_column :posts, :risk_reward, :string
  end
end
