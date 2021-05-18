class AddFk < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :organiser, index: true
    add_reference :attendances, :event
    add_reference :attendances, :user
  end
end
