class AddLogsTable < ActiveRecord::Migration[5.2]
def self.up
    create_table :logs do |t|
      t.timestamp :timestamp, null: false
      t.string :data, null: false, default: ""

    end
    add_index :logs, :id, unique: true

  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
