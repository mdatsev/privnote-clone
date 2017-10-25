module ApplicationHelper
    def flash_class(level)
        case level
            when "notice" then "alert alert-info"
            when "success" then "alert alert-success"
            when "warning" then "alert alert-warning"
            when "danger" then "alert alert-danger"
        end
    end
end
