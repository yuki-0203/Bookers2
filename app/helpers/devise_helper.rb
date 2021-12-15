
module DeviseHelper
  def bootstrap_alert(key)
    case key
    when "notice"
      "Success"
    when "error"
      "danger"
    end
  end
end