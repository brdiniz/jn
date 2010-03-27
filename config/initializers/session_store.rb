# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_job-now_session',
  :secret      => '29afc7a5ef9d93a40a50cec5ebb0b1ba1036cff505cbde694afedd62d48233837dd3a4f3003980a7fd46deec53e302ccc6019bc995d4bc65d382d095f0282856'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
