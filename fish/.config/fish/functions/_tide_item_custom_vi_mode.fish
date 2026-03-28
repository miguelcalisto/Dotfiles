function _tide_item_custom_vi_mode
    switch $fish_bind_mode
        case insert
            echo -n '[i]'
        case default
            echo -n '[n]'
        case visual
            echo -n '[v]'
        case '*'
            echo -n '[?]'
    end
end

