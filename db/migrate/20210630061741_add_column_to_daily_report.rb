class AddColumnToDailyReport < ActiveRecord::Migration[5.2]
  def change
    add_column :daily_reports, :username, :string
    add_column :daily_reports, :title, :string
    add_reference :comments, :daily_report, foreign_key: true
    add_reference :daily_reports, :user, foreign_key: true

    add_column :daily_reports, :winround, :integer
    add_column :daily_reports, :loseround, :integer
    add_column :daily_reports, :decide, :string
    add_column :daily_reports, :rate, :float
    add_column :daily_reports, :tire, :float
  end
end
