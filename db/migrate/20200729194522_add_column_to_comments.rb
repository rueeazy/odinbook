class AddColumnToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :post, index: true, foreign_key: true
  end
end
