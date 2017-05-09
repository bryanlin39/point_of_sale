class Purchase < ActiveRecord::Base

scope(:purchase_date, -> (start_date, end_date) do
  where("date BETWEEN ? AND ?", start_date, end_date)
  end)

end
