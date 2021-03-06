class CreateGoogleusers < ActiveRecord::Migration
  def change
    create_table :googleusers do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.integer :user_id

      t.timestamps
    end
  end
end
