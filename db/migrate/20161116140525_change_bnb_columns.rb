class ChangeBnbColumns < ActiveRecord::Migration[5.0]
  def change
    change_column :air_bnbs, :scrape_id, :integer, limit: 8
  end
end
