class AddColumnToDailyReport < ActiveRecord::Migration[5.2]
  def change
    add_column :daily_reports, :username, :string
    add_column :daily_reports, :title, :string
    add_reference :comments, :daily_report, foreign_key: true
  end
end
