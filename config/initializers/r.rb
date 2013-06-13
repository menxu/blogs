class R
  HASH = YAML.load_file(Rails.root.join('config/r.yaml'))

  WEIBO_KEY = HASH['weibo_key']
  WEIBO_SECRET = HASH['weibo_secret']

  WEIBO_REDIRECT_URI = HASH['weibo_redirect_uri']
end
Weibo2::Config.api_key = R::WEIBO_KEY
Weibo2::Config.api_secret = R::WEIBO_SECRET
Weibo2::Config.redirect_uri = R::WEIBO_REDIRECT_URI