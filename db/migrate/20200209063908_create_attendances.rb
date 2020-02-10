class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true
      t.timestamps
    end
  end
end
