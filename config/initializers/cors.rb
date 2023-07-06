Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'https://vocal-elf-856767.netlify.app' # Replace with the appropriate origin of your React app
  
      resource '/api/*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options],
        credentials: true
    end
  end
