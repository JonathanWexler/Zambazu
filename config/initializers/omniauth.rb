OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '117964625059882', 'ec6297cdc17bace782983fb6015acb21'#, {:scope =&gt; 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'RSwTwCXQTW639rD0kwxmhQ', 'cC3cLNmKBEgGrvQEzyPN6likKvIEVNEDnap1Dg5NA'#, {:scope =&gt; 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
end