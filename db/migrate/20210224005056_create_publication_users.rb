class CreatePublicationUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :publication_users do |t|
      t.references :user, foreign_key: true
      t.references :publications, foreign_key: true

      t.timestamps
    end
  end
end
