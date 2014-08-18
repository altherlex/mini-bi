module SimpleForm
  module Components
    # Needs to be enabled in order to do automatic lookups
    module Description
      # Name of the component method
      def desc(wrapper_options = nil)
        object.send(attribute_name) if @builder.instance_variable_get('@lookup_action') == :show
      end
    end
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::Description)
