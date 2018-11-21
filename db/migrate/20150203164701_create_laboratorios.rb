class CreateLaboratorios < ActiveRecord::Migration
  def change
    create_table :laboratorios do |t|
      t.text :organismos
      t.string :nivel
      t.string :pesquisador
      t.string :tel_pesquisador
      t.integer :usuario_id

      t.timestamps
    end
  end
end
