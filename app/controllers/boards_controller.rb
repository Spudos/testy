class BoardsController < ApplicationController

def sales
    start_date = (Date.current - 5.years)
    end_date = (Date.current)
    @result = Info.where(date: start_date..end_date).select("SUM(ord) AS ord_sum, SUM(val) AS val_sum").first
end

end