class CreateBorrows < ActiveRecord::Migration[5.2]
  def change
    create_table :borrows do |t|
      t.references :lender, index: true
      t.references :borrower, index: true
      t.references :item, index: true
      t.datetime :returned_at

      t.timestamps
    end
  end
end
