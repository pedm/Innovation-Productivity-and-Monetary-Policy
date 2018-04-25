function [ M_ ] = change_param( M_, param_name, new_value)

    orig_value = M_.params( strmatch(param_name, M_.param_names,'exact') );

    M_.params( strmatch(param_name, M_.param_names,'exact') )      = new_value;

    fprintf([param_name, ' : original = %6.2f, new value = %6.2f \n'], orig_value, new_value)

end

