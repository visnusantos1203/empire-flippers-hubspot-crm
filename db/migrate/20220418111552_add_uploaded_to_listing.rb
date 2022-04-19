class AddUploadedToListing < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :uploaded, :boolean, default: false
  end
end
