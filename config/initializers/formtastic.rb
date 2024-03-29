module Formtastic
  module DatePicker
    protected
 
    def datepicker_input(method, options = {})
      format = format = options[:format] || Date::DATE_FORMATS[:default] || "%d %b %Y"
      string_input(method, datepicker_options(format, object.send(method)).merge(options))
    end
 
    # Generate html input options for the datepicker_input
    #
    def datepicker_options(format, value = nil)
      datepicker_options = {:value => value.try(:strftime, format), :input_html => {:class => 'ui-datepicker'}}
    end
  end
end
Formtastic::SemanticFormBuilder.send(:include, Formtastic::DatePicker)
# Formtastic::FormBuilder.i18n_lookups_by_default = true
