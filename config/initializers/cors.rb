Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:3001' # Replace with the appropriate origin of your React app
  
      resource '/api/*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options],
        credentials: true
    end
  end
