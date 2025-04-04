module TransactionsHelper
  def status_color(status)
    case status
    when 'completed' then 'success'
    when 'failed' then 'danger'
    when 'refunded' then 'warning'
    else 'secondary'
    end
  end
end
