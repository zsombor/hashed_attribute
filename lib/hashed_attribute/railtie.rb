module HashedAttribute
  class Railtie < Rails::Railtie
    initializer 'hashed-attribute extension' do
      ActiveRecord::Base.extend HashedAttribute::Extension
    end
  end
end
