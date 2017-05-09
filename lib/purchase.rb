class Purchase < ActiveRecord::Base


scope(:purchase_date, -> (start_date, end_date) do
  where("date > ?", start_date) && where("date < ?", end_date)
  end)
end
