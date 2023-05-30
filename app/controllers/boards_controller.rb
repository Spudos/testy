class BoardsController < ApplicationController

def sales
    start_datem = (Time.current.beginning_of_month)
    start_datey = (Time.current.beginning_of_year)
    end_datem = (Time.current.end_of_month)
    end_date = (Date.current)
    @result_today = Info.where(date: Date.current).select("SUM(ord) AS ord_sum, SUM(val) AS val_sum, SUM(bud_ord) AS bud_ord_sum, SUM(bud_val) AS bud_val_sum, SUM(py_ord) AS py_ord_sum, SUM(py_val) AS py_val_sum").first
    @result_month = Info.where(date: start_datem..end_date).select("SUM(ord) AS ord_sum, SUM(val) AS val_sum, SUM(bud_ord) AS bud_ord_sum, SUM(bud_val) AS bud_val_sum, SUM(py_ord) AS py_ord_sum, SUM(py_val) AS py_val_sum").first
    @result_year = Info.where(date: start_datey..end_date).select("SUM(ord) AS ord_sum, SUM(val) AS val_sum, SUM(bud_ord) AS bud_ord_sum, SUM(bud_val) AS bud_val_sum, SUM(py_ord) AS py_ord_sum, SUM(py_val) AS py_val_sum").first
    @budget_month = Info.where(date: start_datem..end_datem).select("SUM(ord) AS ord_sum, SUM(val) AS val_sum, SUM(bud_ord) AS bud_ord_sum, SUM(bud_val) AS bud_val_sum, SUM(py_ord) AS py_ord_sum, SUM(py_val) AS py_val_sum").first

end

def checksum
   @check = result_today.val_sum - result_today.bud_val_sum 
end

end