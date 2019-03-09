class AddLoginsTable < ActiveRecord::Migration[5.2]
  def self.up
    create_table :logins do |t|
      t.integer :customer_id, null: false

    end
    add_index :logins, :id, unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
