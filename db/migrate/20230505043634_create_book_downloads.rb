class CreateBookDownloads < ActiveRecord::Migration[7.0]
  def change
    create_table :book_downloads do |t|

      t.timestamps
    end
  end
end
