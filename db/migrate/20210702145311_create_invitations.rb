class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.references :event, null: false
      t.references :attendee, null: false

      t.timestamps
    end
  end
end
