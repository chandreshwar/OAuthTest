Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['A6B9FuCbJlgkrUH246fGJucYy'], ENV['d62moaS0PXeXtvFz9jISNVrWVZAc6UeFjAjgkQ0IAWr5InG101']

  provider :facebook, ENV['1398189810480323'], ENV['7ed2b4844727ba4f767f8ebef2654104'],
           scope: 'public_profile', info_fields: 'id,name,link'

  provider :google_oauth2, ENV["165757924048-9eoe6llr5067k4qj0ggb5jinmsa9su8m.apps.googleusercontent.com"], ENV["J380piaQTayFL4a-M3qql0bL"],
           scope: 'profile', image_aspect_ratio: 'square', image_size: 48, access_type: 'online', name: 'google',
           access_type: "offline", skip_jwt: true

  provider :linkedin, ENV['75i5xriteci8fv'], ENV['xjOptrWoVpIyuSje'],
           scope: 'r_basicprofile',
           fields: ['id', 'first-name', 'last-name', 'location', 'picture-url', 'public-profile-url']

  OmniAuth.config.on_failure = Proc.new do |env|
    SessionsController.action(:auth_failure).call(env)
    # error_type = env['omniauth.error.type']
    # new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{error_type}"
    # [301, {'Location' => new_path, 'Content-Type' => 'text/html'}, []]
  end
end
