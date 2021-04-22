class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :street
      t.string :apartment_number
      t.string :postcode
      t.string :city
      t.boolean :rodo
      t.float :price

      t.timestamps
    end
  end
end
