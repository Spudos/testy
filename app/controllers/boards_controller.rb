class BoardsController < ApplicationController

def sales
    start_datem = (Time.current.beginning_of_month)
    start_datey = (Time.current.beginning_of_year)
    end_date = (Date.current)
    @result_today = Info.where(date: Date.current).select("COALESCE(SUM(ord), 0) AS ord_sum, COALESCE(SUM(val), 0) AS val_sum, COALESCE(SUM(bud_ord), 0) AS bud_ord_sum, COALESCE(SUM(bud_val), 0) AS bud_val_sum, COALESCE(SUM(py_ord), 0) AS py_ord_sum, COALESCE(SUM(py_val), 0) AS py_val_sum").group(:id).first
    @result_month = Info.where(date: start_datem..end_date).select("COALESCE(SUM(ord), 0) AS ord_sum, COALESCE(SUM(val), 0) AS val_sum, COALESCE(SUM(bud_ord), 0) AS bud_ord_sum, COALESCE(SUM(bud_val), 0) AS bud_val_sum, COALESCE(SUM(py_ord), 0) AS py_ord_sum, COALESCE(SUM(py_val), 0) AS py_val_sum").group(:id).first
    @result_year = Info.where(date: start_datey..end_date).select("COALESCE(SUM(ord), 0) AS ord_sum, COALESCE(SUM(val), 0) AS val_sum, COALESCE(SUM(bud_ord), 0) AS bud_ord_sum, COALESCE(SUM(bud_val), 0) AS bud_val_sum, COALESCE(SUM(py_ord), 0) AS py_ord_sum, COALESCE(SUM(py_val), 0) AS py_val_sum").group(:id).first

end

def checksum
   @check = result_today.val_sum - result_today.bud_val_sum 
end

end
