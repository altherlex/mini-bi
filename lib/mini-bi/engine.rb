require 'rails'

module MiniBi
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework :rspec, :view_specs => false #, :fixture => false
      #g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      #g.assets false
      #g.helper false
    end

    config.to_prepare do
    end
  end
end
