class BoardsController < ApplicationController
   def sales
      start_datem = (Time.current.beginning_of_month)
      start_datey = (Time.current.beginning_of_year)
      end_datem = (Time.current.end_of_month)
      end_date = (Date.current)
      date_ranges = [
         ["@result_today", Date.current],
         ["@result_month", start_datem..end_date],
         ["@result_year", start_datey..end_date],
         ["@budget_month", start_datem..end_datem]
      ]

      date_ranges.each do |var_name, range|
         values = Info.where(date: range).pluck(Arel.sql("COALESCE(SUM(ord), 0), COALESCE(SUM(val), 0), COALESCE(SUM(bud_ord), 0), COALESCE(SUM(bud_val), 0), COALESCE(SUM(py_ord), 0), COALESCE(SUM(py_val), 0)")).first
         hashed_result = %i[ord_sum val_sum bud_ord_sum bud_val_sum py_ord_sum py_val_sum].zip(values).to_h
         instance_variable_set(var_name, hashed_result)
      end
   end

   def checksum
      @check = result_today.val_sum - result_today.bud_val_sum
   end
end
