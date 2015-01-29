OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "fqvCypetw2ZgbUFCaaGUw6qlt", "gPJjbjPNeSTJys7GtC0d24RnjDn2sQZSIRr49Hzkk1KeRRMM5V" 
end