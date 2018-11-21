class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :email
      t.string :senha
      t.string :auth_token
      t.string :senha_reset_token
      t.timestamp :senha_reset_sent_at

      t.timestamps
    end
  end
end
