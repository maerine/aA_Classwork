class AddSessionToken < ActiveRecord::Migration[5.2]
  def change
    add_column :session_token, presence: true, uniqueness: true
  end
end
